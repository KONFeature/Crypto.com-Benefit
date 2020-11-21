import 'dart:math';

import 'package:crypto_benefit/app/domain/object/statistic/computed_statistic.dart';
import 'package:crypto_benefit/app/domain/object/statistic_chart/statistic_chart.dart';
import 'package:crypto_benefit/app/domain/object/statistic_chart/statistic_chart_spot.dart';
import 'package:crypto_benefit/app/domain/usecases/stat_detail/compute_statistic_chart.usecase.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'stat_chart.viewmodel.g.dart';

class StatChartViewModel = _StatChartViewModelBase with _$StatChartViewModel;

/// The view model for our statistic detail view model.
abstract class _StatChartViewModelBase with Store {
  /// Our use case to compute the statistic cart
  final _computeStatsUseCase = inject<ComputeStatisticChartUseCase>();

  ObservableStream<StatisticChart> _statChart;

  @observable
  Map<AmountType, bool> _amountSelected = ObservableMap();

  @computed
  Map<AmountType, bool> get amountSelected => _amountSelected;

  @computed
  bool get isLoading =>
      _statChart == null || _statChart.status == StreamStatus.waiting;

  @computed
  Iterable<StatisticChartSpot> get statSpots => _statChart.value.spots;

  @computed
  double get minTimestamp {
    if (_statChart == null ||
        _statChart.value == null ||
        _statChart.value.spots == null ||
        _statChart.value.spots.isEmpty) return 0.0;

    final dateList = statSpots.map((spot) => spot.timestamp);
    return dateList.reduce(min);
  }

  @computed
  double get maxTimestamp {
    if (_statChart == null ||
        _statChart.value == null ||
        _statChart.value.spots == null ||
        _statChart.value.spots.isEmpty) return double.maxFinite;

    final dateList = statSpots.map((spot) => spot.timestamp);
    return dateList.reduce(max);
  }

  @observable
  double _startTimestamp;

  @observable
  double _endTimestamp;

  @observable
  RangeValues _currentPeriodRange;

  @computed
  RangeValues get periodRangeValue => _currentPeriodRange ?? RangeValues(minTimestamp, maxTimestamp);

  @computed
  Map<AmountType, List<FlSpot>> get statSpotsByType {
    final result = Map<AmountType, List<FlSpot>>();
    // For each selected amount
    _amountSelected.keys.where((type) => _amountSelected[type]).forEach((type) {
      // Add the type if absent
      result.putIfAbsent(
          type,
          () =>
              // Compute the spots matching the amount type selected
              _statChart.value.spots.where((statSpot) {
                // Compare to start and end timestamp of the graph
                bool startCondition = statSpot.timestamp > periodRangeValue.start;
                bool endCondition = statSpot.timestamp < periodRangeValue.end;
                return startCondition && endCondition;
              }).map((statSpot) {
                // Get the value to add corresponding to the current amount type we are checking
                double chartSpotValue;
                switch (type) {
                  case AmountType.AMOUNT_USDT:
                    chartSpotValue = statSpot.amountUsd;
                    break;
                  case AmountType.TOTAL_USDT:
                    chartSpotValue = statSpot.totalAmountUsd;
                    break;
                  default:
                    chartSpotValue = 0.0;
                    break;
                }
                return FlSpot(statSpot.timestamp, chartSpotValue);
              }).toList());
    });
    // Return our map
    return result;
  }

  @computed
  double get amountInterval {
    // Exit if we have no value to compute or no selected type
    if (isLoading || !_amountSelected.containsValue(true)) return 0.0;

    final selectedTypes =
        _amountSelected.keys.where((type) => _amountSelected[type]);

    final amountList = statSpots.expand((spot) => selectedTypes.map((type) {
          switch (type) {
            case AmountType.TOTAL_USDT:
              return spot.totalAmountUsd;
            case AmountType.AMOUNT_USDT:
              return spot.amountUsd;
          }
        }));
    final minAmount = amountList.reduce(min);
    final maxAmount = amountList.reduce(max);
    return (maxAmount - minAmount) / 6;
  }

  @computed
  double get dateAxisInterval =>
      (periodRangeValue.end - periodRangeValue.start) / 2;

  _StatChartViewModelBase() {
    // Init our selected amount type map to true
    AmountType.values
        .forEach((type) => amountSelected.putIfAbsent(type, () => true));
  }

  @action
  computeChart(ComputedStatistic computedStatistic) {
    // Launch the statistic computation use case
    _statChart = _computeStatsUseCase
        .watch(
            ComputeStatisticChartParams(computedStatistic: computedStatistic))
        .asObservable();
  }

  @action
  selectAmountType(AmountType type, bool isSelected) {
    // TODO : Assert we got at least one value checked
    amountSelected[type] = isSelected;
  }

  @action
  periodChange(RangeValues periodValues) {
    print("Updating timestamp to $periodValues");
    _currentPeriodRange = periodValues;
    print("Min and max timestamp to $minTimestamp && $maxTimestamp");
    _startTimestamp = periodRangeValue.start;
    _endTimestamp = periodRangeValue.end;
    print("Current period $periodRangeValue");
  }
}

enum AmountType { TOTAL_USDT, AMOUNT_USDT }

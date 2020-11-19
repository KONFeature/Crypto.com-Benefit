import 'dart:math';

import 'package:crypto_benefit/app/domain/object/statistic/computed_statistic.dart';
import 'package:crypto_benefit/app/domain/object/statistic_chart/statistic_chart.dart';
import 'package:crypto_benefit/app/domain/object/statistic_chart/statistic_chart_spot.dart';
import 'package:crypto_benefit/app/domain/usecases/stat_detail/compute_statistic_chart.usecase.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';
import 'package:fl_chart/fl_chart.dart';
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
  Map<AmountType, List<FlSpot>> get statSpotsByType {
    final result = Map<AmountType, List<FlSpot>>();
    // For each selected amount
    _amountSelected.keys.where((type) => _amountSelected[type]).forEach((type) {
      // Add the type if absent
      result.putIfAbsent(
          type,
          () =>
              // Compute the spots matching the amount type selected
              _statChart.value.spots.map((statSpot) {
                double value;
                switch (type) {
                  case AmountType.AMOUNT_USDT:
                    value = statSpot.amountUsd;
                    break;
                  case AmountType.TOTAL_USDT:
                    value = statSpot.totalAmountUsd;
                    break;
                  default:
                    value = 0.0;
                    break;
                }
                return FlSpot(statSpot.timestamp, value);
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
    print("min $minAmount, max $maxAmount");
    return (maxAmount - minAmount) / 10;
  }

  @computed
  double get dateInterval {
    if (statSpots == null || statSpots.isEmpty) return 0.0;

    final dateList = statSpots.map((spot) => spot.timestamp);
    final minTimestamp = dateList.reduce(min);
    final maxTimestamp = dateList.reduce(max);
    return (maxTimestamp - minTimestamp) / 2;
  }

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
    amountSelected[type] = isSelected;
  }
}

enum AmountType { TOTAL_USDT, AMOUNT_USDT }

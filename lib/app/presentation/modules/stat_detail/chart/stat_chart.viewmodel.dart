import 'dart:async';
import 'dart:math';

import 'package:crypto_benefit/app/domain/object/statistic/computed_statistic.dart';
import 'package:crypto_benefit/app/domain/object/statistic_chart/statistic_chart.dart';
import 'package:crypto_benefit/app/domain/object/statistic_chart/statistic_chart_filter.dart';
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

  StreamController<StatisticChartFilter> _chartFilterStreamController =
      StreamController();

  @observable
  ObservableFuture<ComputeStatisticChartResult> _computeChartResult;

  @computed
  ObservableStream<StatisticChart> get _chartStream => isLoading
      ? null
      : _computeChartResult.value.statisticChartStream.asObservable();

  @computed
  bool get isLoading =>
      _computeChartResult == null ||
      _computeChartResult.status == FutureStatus.pending;

  @computed
  bool get isChartLoading => _chartStream == null || _chartStream.value == null;

  @computed
  Iterable<StatisticChartSpot> get _statSpots => _chartStream.value.spots;

  @computed
  double get minTimestamp =>
      isLoading ? 0.0 : _computeChartResult.value.minTimestmap;

  @computed
  double get maxTimestamp =>
      isLoading ? double.maxFinite : _computeChartResult.value.maxTimestmap;

  @computed
  Map<StatisticChartAmountType, List<FlSpot>> get statSpotsByType {
    if (isLoading || isChartLoading) return Map();

    final result = Map<StatisticChartAmountType, List<FlSpot>>();
    _statSpots.forEach((spot) {
      result.putIfAbsent(spot.amountType, () => List.empty(growable: true));
      if (result.containsKey(spot.amountType)) {
        result[spot.amountType].add(FlSpot(spot.timestamp, spot.amount));
      }
    });
    return result;
  }

  @computed
  double get amountInterval {
    // Exit if we have no value to compute or no selected type
    if (isLoading || isChartLoading) return 1.0;

    final amountList = _statSpots.map((spot) => spot.amount);
    final minAmount = amountList.reduce(min);
    final maxAmount = amountList.reduce(max);
    return (maxAmount - minAmount) / 6;
  }

  @computed
  double get dateAxisInterval =>
      (maxTimestamp - minTimestamp) / 2; // TODO : Get current filter value

  @action
  computeChart(ComputedStatistic computedStatistic) async {
    print("Calling the computation");
    _computeChartResult = _computeStatsUseCase
        .execute(ComputeStatisticChartParams(
          computedStatistic: computedStatistic,
          filterStream: _chartFilterStreamController.stream,
        ))
        .asObservable();
  }

  @action
  onFilterUpdated(StatisticChartFilter chartFilter) {
    // If the stream is open we push the new filter to it
    if (!_chartFilterStreamController.isClosed) {
      _chartFilterStreamController.add(chartFilter);
    }
  }
}

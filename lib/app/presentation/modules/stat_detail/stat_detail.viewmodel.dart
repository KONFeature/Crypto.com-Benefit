import 'dart:math';

import 'package:crypto_benefit/app/domain/object/statistic/computed_statistic.dart';
import 'package:crypto_benefit/app/domain/object/statistic_chart/statistic_chart.dart';
import 'package:crypto_benefit/app/domain/object/statistic_chart/statistic_chart_spot.dart';
import 'package:crypto_benefit/app/domain/usecases/stat_detail/compute_statistic_chart.usecase.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';
import 'package:mobx/mobx.dart';

part 'stat_detail.viewmodel.g.dart';

class StatDetailViewModel = _StatDetailViewModelBase with _$StatDetailViewModel;

/// The view model for our statistic detail view model.
abstract class _StatDetailViewModelBase with Store {
  /// Our use case to compute the statistic cart
  final _computeStatsUseCase = inject<ComputeStatisticChartUseCase>();

  @observable
  ObservableStream<StatisticChart> _statChart;

  @computed
  bool get isLoading =>
      _statChart == null || _statChart.status == StreamStatus.waiting;

  @computed
  Iterable<StatisticChartSpot> get statSpots => _statChart.value.spots;

  @computed
  double get amountInterval {
    if (statSpots == null || statSpots.isEmpty) return 0.0;

    final amountList = statSpots.map((spot) => spot.amount);
    final minAmount = amountList.reduce(min);
    final maxAmount = amountList.reduce(max);
    return (maxAmount - minAmount) / 6;
  }

  @computed
  double get dateInterval {
    if (statSpots == null || statSpots.isEmpty) return 0.0;

    final dateList = statSpots.map((spot) => spot.timestamp);
    final minTimestamp = dateList.reduce(min);
    final maxTimestamp = dateList.reduce(max);
    return (maxTimestamp - minTimestamp) / 6;
  }

  @action
  computeChart(ComputedStatistic computedStatistic) async {
    // Launch the statistic computation use case
    _statChart = _computeStatsUseCase
        .watch(
            ComputeStatisticChartParams(computedStatistic: computedStatistic))
        .asObservable();
  }
}

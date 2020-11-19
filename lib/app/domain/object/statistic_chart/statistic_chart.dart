import 'package:crypto_benefit/app/domain/object/statistic/computed_statistic.dart';

import 'statistic_chart_spot.dart';

/// Class representing a statistic chart object
class StatisticChart {
  /// The base statistic object
  final ComputedStatistic statistic;

  /// All the spot for our chart
  final Iterable<StatisticChartSpot> spots;

  StatisticChart(this.statistic, this.spots);
}

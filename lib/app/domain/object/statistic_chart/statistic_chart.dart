import 'package:flutter/foundation.dart';

import 'statistic_chart_spot.dart';

/// Class representing a statistic chart object
class StatisticChart {
  /// All the spot for our chart
  final Iterable<StatisticChartSpot> spots;

  StatisticChart({
    @required this.spots,
  });
}

import 'package:flutter/foundation.dart';

/// Class representing a spot on the statistic chart
class StatisticChartSpot {
  final double timestamp;

  final double amountUsd;

  final double totalAmountUsd;

  StatisticChartSpot({
    @required this.timestamp,
    @required this.amountUsd,
    @required this.totalAmountUsd,
  });
}

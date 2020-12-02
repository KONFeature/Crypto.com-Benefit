import 'package:crypto_benefit/app/domain/object/statistic_chart/statistic_chart_filter.dart';
import 'package:flutter/foundation.dart';

/// Class representing a spot on the statistic chart
class StatisticChartSpot {
  final double timestamp;

  final double amount;

  final StatisticChartAmountType amountType;

  StatisticChartSpot({
    @required this.timestamp,
    @required this.amount,
    @required this.amountType,
  });
}

import 'package:flutter/cupertino.dart';

/// Class representing a statistic chart filter object
class StatisticChartFilter {
  /// The start period we want a chart for
  double startPeriod;

  /// The end period we want a chart for
  double endPeriod;

  /// All the amounts to display
  final List<StatisticChartAmountType> amounts;

  StatisticChartFilter({
    this.startPeriod,
    this.endPeriod,
    @required this.amounts,
  });
}

enum StatisticChartAmountType {
  TRANSACTION_USD,
  CUMULATIVE_USD,
}

/// Extenstion on our enum, to get better string representation
extension StatisticChartAmountExtension on StatisticChartAmountType {
  /// Return a litteral for our enum
  String get name {
    switch (this) {
      case StatisticChartAmountType.TRANSACTION_USD:
        return 'Transaction in USDT';
      case StatisticChartAmountType.CUMULATIVE_USD:
        return 'Total in USDT';
      default:
        return 'Unknwon';
    }
  }
}

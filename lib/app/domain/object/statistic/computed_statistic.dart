import 'package:crypto_benefit/app/domain/object/statistic/statistic.dart';
import 'package:flutter/foundation.dart';

/// Simple class representing a computed stats object
class ComputedStatistic extends Statistic {
  // All the computed stats
  final int transactionsCount;
  final double totalNativeAmount;
  final double totalUsdAmount;
  final double positiveUsdAmount;
  final double negativeUsdAmount;

  /// Constructors
  ComputedStatistic({
    @required Statistic stat,
    @required this.transactionsCount,
    @required this.totalNativeAmount,
    @required this.totalUsdAmount,
    @required this.positiveUsdAmount,
    @required this.negativeUsdAmount,
  }) : super(id: stat.id, name: stat.name, filter: stat.filter);
}

import 'package:crypto_benefit/app/domain/object/statistic/statistic.dart';

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
    Statistic stat,
    this.transactionsCount,
    this.totalNativeAmount,
    this.totalUsdAmount,
    this.positiveUsdAmount,
    this.negativeUsdAmount,
  }) : super(name: stat.name, kinds: stat.kinds, fileTypes: stat.fileTypes);
}

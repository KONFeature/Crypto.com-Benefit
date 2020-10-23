import 'package:crypto_benefit/app/domain/object/statistic/statistic.dart';

/// Simple class representing a the stats of transactions for a specific kinds
class KindStatistic extends Statistic {
  final String kindName;

  KindStatistic(
    this.kindName, {
    transactionsCount,
    totalNativeAmount,
    totalUsdAmount,
    positiveUsdAmount,
    negativeUsdAmount,
  }) : super(
          transactionsCount: transactionsCount,
          totalUsdAmount: totalUsdAmount,
          positiveUsdAmount: positiveUsdAmount,
          negativeUsdAmount: negativeUsdAmount,
        );

  KindStatistic.fromStatistic(this.kindName, Statistic stat)
      : super(
            transactionsCount: stat.transactionsCount,
            totalUsdAmount: stat.totalUsdAmount,
            positiveUsdAmount: stat.positiveUsdAmount,
            negativeUsdAmount: stat.negativeUsdAmount);
}

/// Simple class representing a the stats of transactions for a specific kinds
class KindStatistic {
  final String kindName;
  final int transactionsCount;
  final double totalNativeAmount;
  final double totalUsdAmount;
  final double positiveUsdAmount;
  final double negativeUsdAmount;

  KindStatistic({
    this.kindName,
    this.transactionsCount,
    this.totalNativeAmount,
    this.totalUsdAmount,
    this.positiveUsdAmount,
    this.negativeUsdAmount,
  });
}

/// Simple class representing a the stats of transactions
class Statistic {
  final int transactionsCount;
  final double totalNativeAmount;
  final double totalUsdAmount;
  final double positiveUsdAmount;
  final double negativeUsdAmount;

  Statistic({
    this.transactionsCount,
    this.totalNativeAmount,
    this.totalUsdAmount,
    this.positiveUsdAmount,
    this.negativeUsdAmount,
  });
}

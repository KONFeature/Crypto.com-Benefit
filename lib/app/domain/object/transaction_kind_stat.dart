import 'package:crypto_benefit/app/domain/object/transaction_kind.dart';

/// Simple class representing a the stats of transactions for a specific kinds
class TransactionStatistic {
  final TransactionKind transactionKind;
  final int transactionsCount;
  final double totalNativeAmount;
  final double totalUsdAmount;
  final double positiveUsdAmount;
  final double negativeUsdAmount;

  TransactionStatistic({
    this.transactionKind,
    this.transactionsCount,
    this.totalNativeAmount,
    this.totalUsdAmount,
    this.positiveUsdAmount,
    this.negativeUsdAmount,
  });
}

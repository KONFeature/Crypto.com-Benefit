import 'package:crypto_benefit/app/domain/object/transaction_kind.dart';

/// Simple class representing our transaction
class Transaction {
  final int id;
  final int fileId;
  final DateTime timestamp;
  final String description;
  final String sourceCurrency;
  final double sourceAmount;
  final String toCurrency;
  final double toAmount;
  final String nativeCurrency;
  final double nativeAmount;
  final double usdAmount;
  final String rawKind;
  final TransactionKind kind;

  Transaction({
    this.id,
    this.fileId,
    this.timestamp,
    this.description,
    this.sourceCurrency,
    this.sourceAmount,
    this.toCurrency,
    this.toAmount,
    this.nativeCurrency,
    this.nativeAmount,
    this.usdAmount,
    this.rawKind,
    this.kind,
  });
}

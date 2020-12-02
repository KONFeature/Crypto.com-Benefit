import 'package:crypto_benefit/app/domain/object/transaction_kind.dart';
import 'package:flutter/foundation.dart';

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
    @required this.id,
    @required this.fileId,
    @required this.timestamp,
    this.description,
    @required this.sourceCurrency,
    @required this.sourceAmount,
    this.toCurrency,
    this.toAmount,
    @required this.nativeCurrency,
    @required this.nativeAmount,
    @required this.usdAmount,
    @required this.rawKind,
    this.kind,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Transaction &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}

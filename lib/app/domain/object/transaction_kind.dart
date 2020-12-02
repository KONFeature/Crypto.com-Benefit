import 'package:flutter/foundation.dart';

/// Simple class representing a transaction kind
class TransactionKind {
  final int id;
  final String name;

  TransactionKind({
    @required this.id,
    @required this.name,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionKind &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}

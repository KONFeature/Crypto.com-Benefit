import 'package:flutter/foundation.dart';

/// Simple class representing a transaction kind
class TransactionKind {
  final int id;
  final String name;

  TransactionKind({
    @required this.id,
    @required this.name,
  });
}

import 'package:moor/moor.dart';

/// Represent the transaction kind table
@DataClassName("TransactionKindEntity")
class TransactionKindsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().customConstraint('UNIQUE')();
}

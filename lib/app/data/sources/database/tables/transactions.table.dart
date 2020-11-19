import 'package:moor/moor.dart';

/// Represent the transaction table
@DataClassName("TransactionEntity")
class TransactionsTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get fileId => integer().customConstraint(
      "REFERENCES imported_files_table(id)  ON UPDATE CASCADE ON DELETE CASCADE")();

  DateTimeColumn get timestamp => dateTime()();

  TextColumn get description => text()();

  TextColumn get sourceCurrency => text()();

  RealColumn get sourceAmount => real()();

  TextColumn get toCurrency => text().nullable()();

  RealColumn get toAmount => real().nullable()();

  TextColumn get nativeCurrency => text()();

  RealColumn get nativeAmount => real()();

  RealColumn get usdAmount => real()();

  TextColumn get rawKind => text().nullable()();

  IntColumn get kindId => integer()
      .nullable()
      .customConstraint("REFERENCES transaction_kinds_table(id)")();
}

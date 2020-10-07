import 'package:moor/moor.dart';

/// Represent the transaction table
@DataClassName("TransactionEntity")
class TransactionsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get fileId => integer()();
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
  IntColumn get kindId => integer().nullable()();

  /// Custon constraints on the table level for composite unique constraint
  @override
  List<String> get customConstraints => [
        // 'UNIQUE(file_id, timestamp, source_currency, source_amount, usd_amount, kind_id)', // Unique constraints TODO : Is that necessary ?
        'FOREIGN KEY (file_id) REFERENCES imported_files_table (id)', // Foreign key on the imported file table
        'FOREIGN KEY (kind_id) REFERENCES transaction_kinds_table (id)' // Foreign key on the imported transaction kind table
      ];
}

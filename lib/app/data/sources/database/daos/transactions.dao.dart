import 'package:crypto_benefit/app/data/sources/database/app_database.dart';
import 'package:crypto_benefit/app/data/sources/database/tables/transactions.table.dart';
import 'package:crypto_benefit/app/domain/object/imported_file.dart';
import 'package:moor/moor.dart';

part 'transactions.dao.g.dart';

/// Class helping us with the table for the transactions
@UseDao(tables: [TransactionsTable])
class TransactionsDao extends DatabaseAccessor<AppDatabase>
    with _$TransactionsDaoMixin {
  /// Constructor that fetch the database
  TransactionsDao(AppDatabase db) : super(db);

  /// Insert a list of transactions entity
  Future<void> insertTransactions(List<TransactionEntity> transactions) {
    print('Inserting ${transactions.length} transactions in the database');
    // Create the transaction in wich we will perform our db operations
    return transaction(() async {
      // Insert each one of our transactions
      for (final transaction in transactions) {
        await _insertTransaction(transaction);
      }
    });
  }

  /// Insert a transaction entity
  Future<void> _insertTransaction(TransactionEntity transaction) async {
    try {
      final transactionId = await into(transactionsTable).insert(transaction);
      print(
          'Successfully inserted a new transaction with the id $transactionId in the database');
    } catch (exception) {
      print(
          'Error occured when inserting a transaction in the database, $exception');
    }
  }

  /// Get all the transactions for a specified file id
  Future<List<TransactionEntity>> getForFileId(int fileId) =>
      (select(transactionsTable)..where((tbl) => tbl.fileId.equals(fileId)))
          .get();

  /// Get all of our imported transactions
  Future<List<TransactionEntity>> getTransactions() =>
      (select(transactionsTable)
            ..orderBy([
              (tbl) => OrderingTerm(
                  expression: tbl.timestamp, mode: OrderingMode.desc)
            ]))
          .get();

  /// Get all of our imported transactions
  Future<List<TransactionEntity>> getTransactionsByKind(int kindId) =>
      (select(transactionsTable)
            ..orderBy([
              (tbl) => OrderingTerm(
                  expression: tbl.timestamp, mode: OrderingMode.desc)
            ])
            ..where((tbl) => tbl.kindId.equals(kindId)))
          .get();

  /// Get a Stream of al the current transactions we got in the database
  Stream<List<TransactionEntity>> watchTransactions() =>
      select(transactionsTable).watch();

  /// Get all of our transactions in a list of kinds
  Future<Iterable<TransactionEntity>> getTransactionsByTypesOrKinds(
      Iterable<FileType> types, Iterable<int> kindIds) async {
    // Query that join with the imported file table, and check for types and kind in the given list
    final query = select(transactionsTable).join([
      leftOuterJoin(db.importedFilesTable,
          db.importedFilesTable.id.equalsExp(transactionsTable.fileId))
    ])
      ..where(db.importedFilesTable.type.isIn(types.map((type) => type.index)) |
          transactionsTable.kindId.isIn(kindIds));
    // Fetch the result
    final transactionsWithFiles = await query.get();
    // Map it and return it
    return transactionsWithFiles
        .map((typedRow) => typedRow.readTable(transactionsTable));
  }
}

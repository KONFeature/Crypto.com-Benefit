import 'package:crypto_benefit/app/data/sources/database/app_database.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';
import 'package:moor/moor.dart';

/// Class helping us with the table for the transactions
class TransactionsDao {
  AppDatabase _db = inject<AppDatabase>();

  /// Insert a list of transactions entity
  Future<void> insertTransactions(List<TransactionEntity> transactions) {
    print('Inserting ${transactions.length} transactions in the database');
    // Create the transaction in wich we will perform our db operations
    return _db.transaction(() async {
      // Insert each one of our transactions
      for (final transaction in transactions) {
        _insertTransaction(transaction);
      }
    });
  }

  /// Insert a transaction entity
  Future<void> _insertTransaction(TransactionEntity transaction) async {
    try {
      final transactionId =
          await _db.into(_db.transactionsTable).insert(transaction);
      print(
          'Successfully inserted a new transaction with the id $transactionId in the database');
    } catch (exception) {
      print(
          'Error occured when inserting a transaction in the database, $exception');
    }
  }

  /// Get all the transactions for a specified file id
  Future<List<TransactionEntity>> getForFileId(int fileId) {
    final getTransactionsQuery = _db.select(_db.transactionsTable);
    getTransactionsQuery.where((tbl) => tbl.fileId.equals(fileId));
    return getTransactionsQuery.get();
  }

  /// Get all of our imported transactions
  Future<List<TransactionEntity>> getTransactions() => (_db.select(
          _db.transactionsTable)
        ..orderBy([
          (tbl) =>
              OrderingTerm(expression: tbl.timestamp, mode: OrderingMode.desc)
        ]))
      .get();

  /// Get all of our imported transactions
  Future<List<TransactionEntity>> getTransactionsByKind(int kindId) =>
      (_db.select(_db.transactionsTable)
            ..orderBy([
              (tbl) => OrderingTerm(
                  expression: tbl.timestamp, mode: OrderingMode.desc)
            ])
            ..where((tbl) => tbl.kindId.equals(kindId)))
          .get();

  /// Remove all the transactions entries
  Future<int> removeAll() async => _db.delete(_db.transactionsTable).go();

  /// Get a Stream of al the current transactions we got in the database
  Stream<List<TransactionEntity>> watchTransactions() =>
      _db.select(_db.transactionsTable).watch();
}

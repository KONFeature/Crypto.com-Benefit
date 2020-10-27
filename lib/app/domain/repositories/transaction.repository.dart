import 'package:crypto_benefit/app/domain/object/imported_file.dart';
import 'package:crypto_benefit/app/domain/object/transaction.dart';

/// Interface for the transaction repository
abstract class ITransactionRepository {
  /// Read csm and import content
  Future<void> importFromCsv(
      List<List<dynamic>> csvRows, int fileId, Map<dynamic, int> kindsId);

  // Delete all the imported transactions
  Future<void> deleteAll();

  /// Get the transactions
  Future<List<Transaction>> getTransactions();

  /// Get the transactions streams
  Stream<List<Transaction>> watchTransactions();

  /// Get the transactions matching the kinds and types parameter
  Future<List<Transaction>> getTransactionsForTypesAndKinds(
      Iterable<FileType> types, Iterable<int> kindIds);
}

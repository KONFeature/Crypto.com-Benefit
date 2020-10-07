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
}

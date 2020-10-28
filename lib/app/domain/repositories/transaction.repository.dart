import 'package:crypto_benefit/app/domain/object/statistic/statistic.dart';
import 'package:crypto_benefit/app/domain/object/transaction.dart';

/// Interface for the transaction repository
abstract class ITransactionRepository {
  /// Read csm and import content
  Future<void> importFromCsv(
      List<List<dynamic>> csvRows, int fileId, Map<dynamic, int> kindsId);

  /// Get the transactions matching the kinds and types parameter
  Stream<Iterable<Transaction>> watchTransactionsForFilter(Filter filter);
}

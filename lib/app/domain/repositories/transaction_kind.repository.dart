import 'package:crypto_benefit/app/domain/object/transaction_kind.dart';

/// Interface for the transaction kinds repository
abstract class ITransactionKindRepository {
  /// Get all the transaction kinds
  Future<Iterable<TransactionKind>> getTransactionKinds();

  /// Parse and put a list of transactions kinds in the database, and then return a map of the string with the kind id associated
  Future<Map<dynamic, int>> putTransactionsKinds(
      Iterable<dynamic> transactionKinds);
}

import 'package:crypto_benefit/app/data/mappers/transaction_kind.mapper.dart';
import 'package:crypto_benefit/app/data/sources/database/app_database.dart';
import 'package:crypto_benefit/app/data/sources/database/daos/transaction_kinds.dao.dart';
import 'package:crypto_benefit/app/domain/object/transaction_kind.dart';
import 'package:crypto_benefit/app/domain/repositories/transaction_kind.repository.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';

/// Interface for the transaction kinds repository
class TransactionKindRepository implements ITransactionKindRepository {
  /// Transactions kind unknown
  static const String TRANSACTION_KIND_UNKNOWN = 'unknown';

  /// DAO
  final _transactionKindsDao = inject<TransactionKindsDao>();

  /// Mapper
  final _transactionKindMapper = inject<TransactionKindMapper>();

  @override
  Future<Iterable<TransactionKind>> getTransactionKinds() async =>
      _transactionKindMapper
          .fromEntities(await _transactionKindsDao.getTransactionKind());

  @override
  Future<Map<dynamic, int>> putTransactionsKinds(
      Iterable<dynamic> transactionKinds) async {
    final rawKindToObjectMap = Map<String, int>();
    for (final rawTransactionKind in transactionKinds) {
      // Check if we already parsed this kind, if yes jump this iteration
      if (rawKindToObjectMap.containsKey(rawTransactionKind)) continue;

      // Extract the name for the dynamic transaction kind
      String transactionKindName;
      if (rawTransactionKind.runtimeType == String &&
          rawTransactionKind.isNotEmpty) {
        transactionKindName = rawTransactionKind;
      } else {
        // If we didn't find it map it to unknown
        transactionKindName = TRANSACTION_KIND_UNKNOWN;
      }

      // Insert it or get it from the database
      TransactionKindEntity transactionKind =
          await _transactionKindsDao.createOrGet(transactionKindName);

      // Then map it and add it to the map
      rawKindToObjectMap[rawTransactionKind] = transactionKind.id;
    }
    // Return the computed map
    return rawKindToObjectMap;
  }
}

import 'package:crypto_benefit/app/data/mappers/transaction.mapper.dart';
import 'package:crypto_benefit/app/data/mappers/transaction_kind.mapper.dart';
import 'package:crypto_benefit/app/data/sources/database/daos/transaction_kinds.dao.dart';
import 'package:crypto_benefit/app/data/sources/database/daos/transactions.dao.dart';
import 'package:crypto_benefit/app/domain/object/transaction.dart';
import 'package:crypto_benefit/app/domain/object/transaction_kind.dart';
import 'package:crypto_benefit/app/domain/object/transaction_kind_stat.dart';
import 'package:crypto_benefit/app/domain/repositories/transaction_kind.repository.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';
import 'package:crypto_benefit/app/data/sources/database/app_database.dart';

/// Interface for the transaction kinds repository
class TransactionKindRepository implements ITransactionKindRepository {
  /// Transactions kind unknown
  static const String TRANSACTION_KIND_UNKNOWN = 'unknown';

  /// DAO
  TransactionKindsDao _transactionKindsDao = inject<TransactionKindsDao>();
  TransactionsDao _transactionsDao = inject<TransactionsDao>();

  /// Mapper
  TransactionKindMapper _transactionKindMapper =
      inject<TransactionKindMapper>();
  TransactionMapper _transactionMapper = inject<TransactionMapper>();

  @override
  Future<List<TransactionKind>> getTransactionKinds() async =>
      _transactionKindMapper
          .fromEntities(await _transactionKindsDao.getTransactionKind());

  @override
  Future<List<TransactionStatistic>> computeTransactionKindStats() async {
    // The list that contains our stats
    List<TransactionStatistic> stats = List();

    // Get the total stats
    List<Transaction> allTransctions = await _transactionMapper
        .fromEntities(await _transactionsDao.getTransactions());
    stats.add(_computeStats(TransactionKind(name: 'All'), allTransctions));

    // Get the stat for each kind of transactions
    List<TransactionKind> kinds = await _transactionKindMapper
        .fromEntities(await _transactionKindsDao.getTransactionKind());
    for (TransactionKind kind in kinds) {
      List<Transaction> transactions = await _transactionMapper
          .fromEntities(await _transactionsDao.getTransactionsByKind(kind.id));
      stats.add(_computeStats(kind, transactions));
    }
    return stats;
  }

  /// Compute the stat object for a given kind and list of transactions
  TransactionStatistic _computeStats(
      TransactionKind kind, List<Transaction> transactions) {
    var totalNative = 0.0;
    var totalUsd = 0.0;
    var positiveUsd = 0.0;
    var negativeUsd = 0.0;

    for (Transaction transaction in transactions) {
      totalNative += transaction.nativeAmount;
      totalUsd += transaction.usdAmount;
      if (transaction.usdAmount.isNegative) {
        negativeUsd += transaction.usdAmount;
      } else {
        positiveUsd += transaction.usdAmount;
      }
    }

    return TransactionStatistic(
        transactionKind: kind,
        transactionsCount: transactions.length,
        totalUsdAmount: totalUsd,
        totalNativeAmount: totalNative,
        positiveUsdAmount: positiveUsd,
        negativeUsdAmount: negativeUsd);
  }

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

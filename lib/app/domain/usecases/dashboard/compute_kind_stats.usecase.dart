import 'package:crypto_benefit/app/domain/object/transaction.dart';
import 'package:crypto_benefit/app/domain/object/transaction_kind.dart';
import 'package:crypto_benefit/app/domain/object/kind_statistic.dart';
import 'package:crypto_benefit/app/domain/repositories/transaction.repository.dart';
import 'package:crypto_benefit/app/domain/usecases/usecase.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';

/// Use case used to clear all the imports done on the app
class ComputeKindStatsUseCase
    implements BaseUseCase<List<KindStatistic>, void> {
  final _transactionRepository = inject<ITransactionRepository>();

  @override
  Future<List<KindStatistic>> execute(void params) async {
    // The list that contains our stats
    List<KindStatistic> stats = List();

    // Get all the transactions
    List<Transaction> transactions =
        await _transactionRepository.getTransactions();

    // Compute stats for all the transactions
    stats.add(_computeStats('All', transactions));

    // Map our transactions with their kind
    Map<String, List<Transaction>> transactionsByKindMap = Map();
    for (final transaction in transactions) {
      // If we don't got a list for this kind we create it
      if (!transactionsByKindMap.containsKey(transaction.kind.name))
        transactionsByKindMap[transaction.kind.name] = List();

      // Add the transaction to the list
      transactionsByKindMap[transaction.kind.name].add(transaction);
    }

    // Compute the stat for the mapped item
    for (final transactionsByKind in transactionsByKindMap.entries) {
      stats
          .add(_computeStats(transactionsByKind.key, transactionsByKind.value));
    }

    // Order the stat by total amount
    stats.sort(
        (stat1, stat2) => stat1.totalUsdAmount.compareTo(stat2.totalUsdAmount));

    // Return the computed stat
    return stats.reversed.toList();
  }

  /// Compute the stat object for a given kind and list of transactions
  KindStatistic _computeStats(String kindName, List<Transaction> transactions) {
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

    return KindStatistic(
        kindName: kindName,
        transactionsCount: transactions.length,
        totalUsdAmount: totalUsd,
        totalNativeAmount: totalNative,
        positiveUsdAmount: positiveUsd,
        negativeUsdAmount: negativeUsd);
  }
}

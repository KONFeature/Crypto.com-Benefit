import 'package:crypto_benefit/app/domain/object/statistic/kind_statistic.dart';
import 'package:crypto_benefit/app/domain/object/transaction.dart';
import 'package:crypto_benefit/app/domain/repositories/statistic.repository.dart';
import 'package:crypto_benefit/app/domain/repositories/transaction.repository.dart';
import 'package:crypto_benefit/app/domain/usecases/usecase.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';

/// Use case used to clear all the imports done on the app
class ComputeKindStatsUseCase
    implements BaseUseCase<List<KindStatistic>, void> {
  final _transactionRepository = inject<ITransactionRepository>();
  final _statisticRepository = inject<IStatisticRepository>();

  @override
  Future<List<KindStatistic>> execute(void params) async {
    // The list that contains our stats
    List<KindStatistic> stats = List();

    // Get all the transactions
    List<Transaction> transactions =
        await _transactionRepository.getTransactions();

    // Compute stats for all the transactions
    final allStat =
        await _statisticRepository.computeStatisticForTransaction(transactions);
    stats.add(KindStatistic.fromStatistic('All', allStat));

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
      final stat = await _statisticRepository
          .computeStatisticForTransaction(transactionsByKind.value);

      stats.add(KindStatistic.fromStatistic(transactionsByKind.key, stat));
    }

    // Order the stat by total amount
    stats.sort(
        (stat1, stat2) => stat1.totalUsdAmount.compareTo(stat2.totalUsdAmount));

    // Return the computed stat
    return stats.reversed.toList();
  }
}

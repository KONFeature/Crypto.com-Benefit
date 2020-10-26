import 'package:crypto_benefit/app/domain/object/imported_file.dart';
import 'package:crypto_benefit/app/domain/object/statistic/computed_statistic.dart';
import 'package:crypto_benefit/app/domain/object/transaction.dart';
import 'package:crypto_benefit/app/domain/repositories/statistic.repository.dart';
import 'package:crypto_benefit/app/domain/repositories/transaction.repository.dart';
import 'package:crypto_benefit/app/domain/usecases/usecase.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';

/// Use case used to compute all the user statistics
class WatchComputedStatsUseCase
    implements StreamUseCase<List<ComputedStatistic>, void> {
  final _transactionRepository = inject<ITransactionRepository>();
  final _statisticRepository = inject<IStatisticRepository>();

  @override
  Stream<List<ComputedStatistic>> watch(void params) =>
      _statisticRepository.watchStatistics().asyncMap((statistics) async {
        // Get all the transactions
        List<Transaction> transactions =
            await _transactionRepository.getTransactions();

        // Get the list of all kinds and types concerned by our stats
        Set<int> kindsId = Set();
        Set<FileType> types = Set();
        statistics.forEach((stat) {
          kindsId.addAll(stat.kinds.map((kind) => kind.id));
          types.addAll(stat.fileTypes);
        });

        // Get all the transactions for this criteria
        List<Transaction> transactionsForKind =
            await _transactionRepository.getTransactionsForKinds(kindsId);
        Map<FileType, List<Transaction>> transactionsForTypes =
            await _transactionRepository.getTransactionsForTypes(types);
        // TODO : All of that in a single sql query for each stats (query with join on kinds and types, for better performance)

        // Then compute each one of our stat from this transactioons
        List<ComputedStatistic> computedStats = List();
        for (var stat in statistics) {
          // Get the transactions set for our stat
          Set<Transaction> transactionsForStat = Set();
          transactionsForStat.addAll(transactionsForKind.takeWhile(
              (transaction) => stat.kinds.contains(transaction.kind.id)));
          transactionsForStat.addAll(transactionsForTypes.entries
              .takeWhile((entry) => stat.fileTypes.contains(entry.key))
              .map((entry) => entry.value
                  .first)); // TODO, why can't map the entries to list of of transactions ???
          // Compute the stat for the founded transactions
          computedStats.add(await _statisticRepository
              .computeStatisticForTransaction(transactions, stat));
        }

        // Return the computed stat
        return computedStats;
      });
}

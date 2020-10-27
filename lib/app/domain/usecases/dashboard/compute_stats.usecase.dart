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
        try {
          print('Start computing for ${statistics.length} statistics');

          // Then compute each one of our stat from this transactioons
          List<ComputedStatistic> computedStats = List();
          // TODO : Switch map for autorefresh when new transactions

          for (var stat in statistics) {
            // Get the transactions set for our stat

            List<Transaction> transactionsForStat =
                await _transactionRepository.getTransactionsForTypesAndKinds(
                    stat.filter.fileTypes,
                    stat.filter.kinds.map((kind) => kind.id));
            print(
                'Total transactions for this stats ${transactionsForStat.length}');
            // Compute the stat for the founded transactions
            computedStats.add(
                await _statisticRepository.computeStatisticForTransaction(
                    transactionsForStat.toList(), stat));
          }

          print('Finish computing statistics');
          // Return the computed stat
          return computedStats;
        } catch (exception) {
          print('Error when computing the statistic $exception');
          rethrow;
        }
      });
}

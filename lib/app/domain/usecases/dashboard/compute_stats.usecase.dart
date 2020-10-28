import 'package:crypto_benefit/app/domain/object/statistic/computed_statistic.dart';
import 'package:crypto_benefit/app/domain/repositories/statistic.repository.dart';
import 'package:crypto_benefit/app/domain/repositories/transaction.repository.dart';
import 'package:crypto_benefit/app/domain/usecases/usecase.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';
import 'package:rxdart/rxdart.dart';

/// Use case used to compute all the user statistics
class WatchComputedStatsUseCase
    implements StreamUseCase<Iterable<ComputedStatistic>, void> {
  final _transactionRepository = inject<ITransactionRepository>();
  final _statisticRepository = inject<IStatisticRepository>();

  @override
  Stream<Iterable<ComputedStatistic>> watch(void params) =>
      _statisticRepository.watchStatistics().switchMap((statistics) {
        try {
          print('Start computing for ${statistics.length} statistics');

          // Then compute each one of our stat from this transactioons
          List<Stream<ComputedStatistic>> computedStatStreams = List();

          for (var stat in statistics) {
            // Find the transactions stream for our stat and put it in our map
            final transactionsStream =
                _transactionRepository.watchTransactionsForFilter(stat.filter);
            // Map the transactions received to computed stat
            final computedStream = transactionsStream.asyncMap(
                (transactions) async => await _statisticRepository
                    .computeStatisticForTransaction(transactions, stat));
            // Add that to our list of stream
            computedStatStreams.add(computedStream);
          }

          // Return a combined stream
          return Rx.combineLatestList(computedStatStreams);
        } catch (exception) {
          print('Error when computing the statistic $exception');
          rethrow;
        }
      });
}

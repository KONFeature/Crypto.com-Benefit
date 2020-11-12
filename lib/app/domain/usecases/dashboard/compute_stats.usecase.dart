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

          if(statistics.isEmpty) {
            // If we got no statistic just return an empty stream
            print('Returning 0 streams for computing statistics');
            return Stream.empty();
          }

          // Then compute each one of our stat from this transactioons
          List<Stream<ComputedStatistic>> computedStatStreams = statistics.map((stat) {
            // Find the transactions stream for our stat and put it in our map
            final transactionsStream =
            _transactionRepository.watchTransactionsForFilter(stat.filter);
            // Map the transactions received to computed stat stream
            return transactionsStream.asyncMap(
                    (transactions) async => await _statisticRepository
                    .computeStatisticForTransaction(transactions, stat));
          });

          // Return the combinaison of all the stream
          print('Returning ${computedStatStreams.length} streams for computing statistics');
          return Rx.combineLatestList(computedStatStreams);
        } catch (exception) {
          print('Error when computing the statistic $exception');
          rethrow;
        }
      });
}

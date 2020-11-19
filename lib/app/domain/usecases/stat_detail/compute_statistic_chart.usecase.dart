import 'package:crypto_benefit/app/domain/object/statistic/computed_statistic.dart';
import 'package:crypto_benefit/app/domain/object/statistic_chart/statistic_chart.dart';
import 'package:crypto_benefit/app/domain/object/statistic_chart/statistic_chart_spot.dart';
import 'package:crypto_benefit/app/domain/repositories/transaction.repository.dart';
import 'package:crypto_benefit/app/domain/usecases/usecase.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';

/// Use case used to compute the statistic chart
class ComputeStatisticChartUseCase
    implements StreamUseCase<StatisticChart, ComputeStatisticChartParams> {
  final _transactionRepository = inject<ITransactionRepository>();

  @override
  Stream<StatisticChart> watch(ComputeStatisticChartParams params) {
    // Find the transactions stream for our stat and put it in our map
    final transactionsStream = _transactionRepository
        .watchTransactionsForFilter(params.computedStatistic.filter);

    return transactionsStream.map((transactions) {
      // TODO : Cumulative amount for transactions

      // Map each transactions into a chart spot
      final spots = transactions.map((transaction) => StatisticChartSpot(
          transaction.timestamp.millisecondsSinceEpoch.toDouble(),
          transaction.usdAmount));

      // Then create our statistic chart
      return StatisticChart(params.computedStatistic, spots);
    });
  }
}

/// Params for our use case
class ComputeStatisticChartParams {
  final ComputedStatistic computedStatistic;

  ComputeStatisticChartParams({this.computedStatistic});
}

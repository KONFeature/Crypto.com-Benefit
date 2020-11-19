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
      // Get all the transaction and sort them by date
      final transactionList = transactions.toList();
      transactionList
          .sort((tx1, tx2) => tx1.timestamp.compareTo(tx2.timestamp));

      // total that will be computed
      double totalAmount = 0.0;

      // Map each transactions into a chart spot
      final List<StatisticChartSpot> spots = List();
      transactionList.forEach((transaction) {
        // Increase the total amount
        totalAmount += transaction.usdAmount;

        // Create and return the stat chart spot
        spots.add(StatisticChartSpot(
          transaction.timestamp.millisecondsSinceEpoch.toDouble(),
          transaction.usdAmount,
          totalAmount,
        ));
      });

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

import 'dart:math';

import 'package:crypto_benefit/app/domain/object/statistic/computed_statistic.dart';
import 'package:crypto_benefit/app/domain/object/statistic_chart/statistic_chart.dart';
import 'package:crypto_benefit/app/domain/object/statistic_chart/statistic_chart_filter.dart';
import 'package:crypto_benefit/app/domain/object/statistic_chart/statistic_chart_spot.dart';
import 'package:crypto_benefit/app/domain/object/transaction.dart';
import 'package:crypto_benefit/app/domain/repositories/transaction.repository.dart';
import 'package:crypto_benefit/app/domain/usecases/usecase.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';

/// Use case used to compute the statistic chart
class ComputeStatisticChartUseCase
    implements
        BaseUseCase<ComputeStatisticChartResult, ComputeStatisticChartParams> {
  final log = Logger(printer: PrettyPrinter());

  final _transactionRepository = inject<ITransactionRepository>();

  @override
  Future<ComputeStatisticChartResult> execute(
      ComputeStatisticChartParams params) async {
    log.i(
        "Computing a new statistic chart for filter ${params.computedStatistic.name ?? "null"}");

    // Find the transactions for the statistic filter
    Iterable<Transaction> transactions = await _transactionRepository
        .getTransactionsForFilter(params.computedStatistic.filter);

    // Extract min and max timestamp
    Iterable<num> timestamps = transactions.map((transaction) =>
        transaction.timestamp.millisecondsSinceEpoch.toDouble());

    // Build the stream that watch for the filter
    final chartStream = params.filterStream
        .map((filter) => _getChartFromFilter(filter, transactions));

    // Then retruen our final object
    return ComputeStatisticChartResult(
      statisticChartStream: chartStream,
      minTimestmap: timestamps.isEmpty ? 0.0 : timestamps.reduce(min),
      maxTimestmap:
          timestamps.isEmpty ? double.maxFinite : timestamps.reduce(max),
    );
  }

  /// Get the chart from the current filter
  StatisticChart _getChartFromFilter(
      StatisticChartFilter filter, Iterable<Transaction> transactions) {
    print("Starting use case");
    // Get all the transaction in the filtered period
    final transactionList = transactions.where((transaction) {
      // Compare to start and end timestamp of the graph
      bool startCondition = transaction.timestamp.isAfter(
          DateTime.fromMillisecondsSinceEpoch(filter.startPeriod.toInt()));
      bool endCondition = transaction.timestamp.isBefore(
          DateTime.fromMillisecondsSinceEpoch(filter.endPeriod.toInt()));
      return startCondition && endCondition;
    }).toList();

    // Then sort them by date
    transactionList.sort((tx1, tx2) => tx1.timestamp.compareTo(tx2.timestamp));

    // The cumulative amount that will be computed
    double totalAmount = 0.0;

    // Map each transactions into a chart spot
    final spots = transactionList
        .map((transaction) {
          print("Into use case stream");
          // Increase the total amount
          totalAmount += transaction.usdAmount;

          // For each type selected, add the amount matching it
          return filter.amounts.map((amountType) {
            double amount;
            switch (amountType) {
              case StatisticChartAmountType.CUMULATIVE_USD:
                amount = totalAmount;
                break;
              case StatisticChartAmountType.TRANSACTION_USD:
              default:
                amount = transaction.usdAmount;
                break;
            }
            // Then return our spot matching the transactions
            return StatisticChartSpot(
              timestamp:
                  transaction.timestamp.millisecondsSinceEpoch.toDouble(),
              amount: amount,
              amountType: amountType,
            );
          });
        })
        .expand((spots) => spots)
        .toList(growable: false);

    // Then create our statistic chart
    print("Returning use case");
    return StatisticChart(spots: spots);
  }
}

/// Params for our use case
class ComputeStatisticChartParams {
  final ComputedStatistic computedStatistic;

  final Stream<StatisticChartFilter> filterStream;

  ComputeStatisticChartParams({
    @required this.computedStatistic,
    @required this.filterStream,
  });
}

/// Result for our use case
class ComputeStatisticChartResult {
  final Stream<StatisticChart> statisticChartStream;

  final minTimestmap;

  final maxTimestmap;

  ComputeStatisticChartResult({
    @required this.statisticChartStream,
    @required this.minTimestmap,
    @required this.maxTimestmap,
  });
}

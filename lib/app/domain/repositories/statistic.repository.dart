import 'package:crypto_benefit/app/domain/object/statistic/computed_statistic.dart';
import 'package:crypto_benefit/app/domain/object/statistic/statistic.dart';
import 'package:crypto_benefit/app/domain/object/transaction.dart';

/// Interface for the statistic repository
abstract class IStatisticRepository {
  // Compute stats for a list of transactions
  Future<ComputedStatistic> computeStatisticForTransaction(
      List<Transaction> transactions, Statistic statistic);

  // Watch all the statistics
  Stream<List<Statistic>> watchStatistics();
}

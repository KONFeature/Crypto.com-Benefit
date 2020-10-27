import 'package:crypto_benefit/app/domain/object/imported_file.dart';
import 'package:crypto_benefit/app/domain/object/statistic/computed_statistic.dart';
import 'package:crypto_benefit/app/domain/object/statistic/statistic.dart';
import 'package:crypto_benefit/app/domain/object/transaction.dart';

/// Interface for the statistic repository
abstract class IStatisticRepository {
  /// Compute stats for a list of transactions
  Future<ComputedStatistic> computeStatisticForTransaction(
      List<Transaction> transactions, Statistic statistic);

  /// Watch all the statistics
  Stream<Iterable<Statistic>> watchStatistics();

  /// Create a new statistic
  Future<int> createStatistic(String name);

  /// Update the statistic filter
  Future<void> updateStatisticFilter(
      int statId, List<int> kindIds, List<FileType> types);

  /// Delete a statistic from the database
  Future<void> deleteStatistic(int statId);
}

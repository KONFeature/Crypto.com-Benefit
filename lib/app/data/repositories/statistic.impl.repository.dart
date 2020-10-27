import 'package:crypto_benefit/app/data/mappers/statistic.mapper.dart';
import 'package:crypto_benefit/app/data/sources/database/app_database.dart';
import 'package:crypto_benefit/app/data/sources/database/daos/statistics.dao.dart';
import 'package:crypto_benefit/app/domain/object/imported_file.dart';
import 'package:crypto_benefit/app/domain/object/statistic/computed_statistic.dart';
import 'package:crypto_benefit/app/domain/object/transaction.dart';
import 'package:crypto_benefit/app/domain/object/statistic/statistic.dart';
import 'package:crypto_benefit/app/domain/repositories/statistic.repository.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';

/// Implementation of the statistic repository
class StatisticRepository implements IStatisticRepository {
  /// DAO we will use
  final _statisticDao = inject<StatisticsDao>();

  /// Mapper
  final _statisticMapper = inject<StatisticMapper>();

  @override
  Future<ComputedStatistic> computeStatisticForTransaction(
      List<Transaction> transactions, Statistic statistic) async {
    // Var we will be computing
    var totalNative = 0.0;
    var totalUsd = 0.0;
    var positiveUsd = 0.0;
    var negativeUsd = 0.0;

    // Perform the computation for each transactions
    for (Transaction transaction in transactions) {
      totalNative += transaction.nativeAmount;
      totalUsd += transaction.usdAmount;
      if (transaction.usdAmount.isNegative) {
        negativeUsd += transaction.usdAmount;
      } else {
        positiveUsd += transaction.usdAmount;
      }
    }

    // Return the resulting object
    return ComputedStatistic(
        stat: statistic,
        transactionsCount: transactions.length,
        totalUsdAmount: totalUsd,
        totalNativeAmount: totalNative,
        positiveUsdAmount: positiveUsd,
        negativeUsdAmount: negativeUsd);
  }

  @override
  Stream<List<Statistic>> watchStatistics() => _statisticDao
      .watchAllStatistics()
      .asyncMap((stats) => _statisticMapper.fromEntities(stats));

  @override
  Future<int> createStatistic(String name) async {
    var newStatId = await _statisticDao.insert(StatisticEntity(
        id: null, name: name, createdTimestamp: DateTime.now()));
    print(
        'Successfully inserted the new statistic \'$name\' with the id $newStatId');
    return newStatId;
  }

  @override
  Future<void> updateStatisticFilter(
      int statId, List<int> kindIds, List<FileType> types) async {
    // Update the kind of the statistics
    await _statisticDao.updateKindsForStat(statId, kindIds);
    // Update the types of the statistic
    await _statisticDao.updateFileTypesForStat(statId, types);
    print('Successfully updated the statistic with id $statId');
  }

  @override
  Future<void> deleteStatistic(int statId) async {
    await _statisticDao.deleteStat(statId);
  }
}

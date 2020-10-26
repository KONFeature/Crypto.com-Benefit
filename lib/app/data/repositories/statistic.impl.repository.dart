import 'package:crypto_benefit/app/data/mappers/statistic.mapper.dart';
import 'package:crypto_benefit/app/data/sources/database/daos/statistics.dao.dart';
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
      .map((stats) => _statisticMapper.fromEntities(stats));
}

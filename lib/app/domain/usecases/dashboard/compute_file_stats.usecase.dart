import 'package:crypto_benefit/app/domain/object/statistic/file_statistic.dart';
import 'package:crypto_benefit/app/domain/object/transaction.dart';
import 'package:crypto_benefit/app/domain/repositories/transaction.repository.dart';
import 'package:crypto_benefit/app/domain/usecases/usecase.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';

/// Use case used to clear all the imports done on the app
class ComputeFileStatsUseCase
    implements BaseUseCase<List<FileStatistic>, void> {
  final _transactionRepository = inject<ITransactionRepository>();

  @override
  Future<List<FileStatistic>> execute(void params) async {
    // The list that contains our stats
    List<FileStatistic> stats = List();

    // Get all the transactions
    List<Transaction> transactions =
        await _transactionRepository.getTransactions();

    // Compute stats for all the transactions
    stats.add(_computeStats('All', transactions));

    // Map our transactions with their kind
    Map<int, List<Transaction>> transactionsByFileIdMap = Map();
    for (final transaction in transactions) {
      // If we don't got a list for this kind we create
      if (!transactionsByFileIdMap.containsKey(transaction.fileId))
        transactionsByFileIdMap[transaction.fileId] = List();

      // Add the transaction to the list
      transactionsByFileIdMap[transaction.fileId].add(transaction);
    }

    // Compute the stat for the mapped item
    for (final transactionsByKind in transactionsByFileIdMap.entries) {
      stats.add(_computeStats(
          transactionsByKind.key.toString(), transactionsByKind.value));
    }

    // Order the stat by total amount
    stats.sort(
        (stat1, stat2) => stat1.totalUsdAmount.compareTo(stat2.totalUsdAmount));

    // Return the computed stat
    return stats.reversed.toList();
  }

  /// Compute the stat object for a given kind and list of transactions
  FileStatistic _computeStats(String fileType, List<Transaction> transactions) {
    var totalNative = 0.0;
    var totalUsd = 0.0;
    var positiveUsd = 0.0;
    var negativeUsd = 0.0;

    for (Transaction transaction in transactions) {
      totalNative += transaction.nativeAmount;
      totalUsd += transaction.usdAmount;
      if (transaction.usdAmount.isNegative) {
        negativeUsd += transaction.usdAmount;
      } else {
        positiveUsd += transaction.usdAmount;
      }
    }

    return FileStatistic(
        filetype: fileType,
        transactionsCount: transactions.length,
        totalUsdAmount: totalUsd,
        totalNativeAmount: totalNative,
        positiveUsdAmount: positiveUsd,
        negativeUsdAmount: negativeUsd);
  }
}

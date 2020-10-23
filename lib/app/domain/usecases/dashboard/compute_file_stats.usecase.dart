import 'package:crypto_benefit/app/domain/object/statistic/file_statistic.dart';
import 'package:crypto_benefit/app/domain/object/transaction.dart';
import 'package:crypto_benefit/app/domain/repositories/import_file.repository.dart';
import 'package:crypto_benefit/app/domain/repositories/statistic.repository.dart';
import 'package:crypto_benefit/app/domain/repositories/transaction.repository.dart';
import 'package:crypto_benefit/app/domain/usecases/usecase.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';

/// Use case used to clear all the imports done on the app
class ComputeFileStatsUseCase
    implements BaseUseCase<List<FileStatistic>, void> {
  final _transactionRepository = inject<ITransactionRepository>();
  final _importedFileRepository = inject<IImportFileRepository>();
  final _statisticRepository = inject<IStatisticRepository>();

  @override
  Future<List<FileStatistic>> execute(void params) async {
    // The list that contains our stats
    List<FileStatistic> stats = List();

    // Get all the transactions
    List<Transaction> transactions =
        await _transactionRepository.getTransactions();

    // Compute stats for all the transactions
    final allStat =
        await _statisticRepository.computeStatisticForTransaction(transactions);
    stats.add(FileStatistic.fromStatistic('All', allStat));

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
    for (final transactionsByFileId in transactionsByFileIdMap.entries) {
      final file =
          await _importedFileRepository.getFileById(transactionsByFileId.key);

      final stat = await _statisticRepository
          .computeStatisticForTransaction(transactionsByFileId.value);

      stats.add(FileStatistic.fromStatistic(file.type.toString(), stat));
    }

    // Order the stat by total amount
    stats.sort(
        (stat1, stat2) => stat1.totalUsdAmount.compareTo(stat2.totalUsdAmount));

    // Return the computed stat
    return stats.reversed.toList();
  }
}

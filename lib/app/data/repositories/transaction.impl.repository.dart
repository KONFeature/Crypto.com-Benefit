import 'package:crypto_benefit/app/data/mappers/transaction.mapper.dart';
import 'package:crypto_benefit/app/data/sources/database/app_database.dart';
import 'package:crypto_benefit/app/data/sources/database/daos/transactions.dao.dart';
import 'package:crypto_benefit/app/domain/exceptions/import_file.exceptions.dart';
import 'package:crypto_benefit/app/domain/object/statistic/statistic.dart';
import 'package:crypto_benefit/app/domain/object/transaction.dart';
import 'package:crypto_benefit/app/domain/repositories/transaction.repository.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';

/// Implementation of the transaction repository
class TransactionRepository implements ITransactionRepository {
  /// DAO we will use
  final _transactionsDao = inject<TransactionsDao>();

  /// Mappers
  final _transactionMapper = inject<TransactionMapper>();

  /// Import CSV rows from imported file to transaction entity
  Future<void> importFromCsv(List<List<dynamic>> csvRows, int fileId,
      Map<dynamic, int> kindsId) async {
    final List<TransactionEntity> transactionEntities = new List();
    for (final csvRow in csvRows) {
      // Get the transaction kind matching the csv entry (throw exception if we didn't find it)
      var rawTransactionKind = csvRow[9];
      if (!kindsId.containsKey(rawTransactionKind))
        throw new UnableToDetermineTransactionKind();

      // Fetch the transaction kind id
      var kindId = kindsId[rawTransactionKind];

      // Map our transaction and add it to the list
      transactionEntities
          .add(_transactionMapper.fromCsvRowToEntity(csvRow, fileId, kindId));
    }

    // Insert all of our entities
    print(
        'Successfully parsed ${transactionEntities.length} transactions from the csv file');
    await _transactionsDao.insertTransactions(transactionEntities);
  }

  @override
  Stream<Iterable<Transaction>> watchTransactionsForFilter(Filter filter) {
    final kindsIds = filter.kinds.map((kind) => kind.id);
    final entitiesStream =
        _transactionsDao.watchTransactionsForFilter(filter.fileTypes, kindsIds);
    return entitiesStream.asyncMap(
        (transactions) => _transactionMapper.fromEntities(transactions));
  }
}

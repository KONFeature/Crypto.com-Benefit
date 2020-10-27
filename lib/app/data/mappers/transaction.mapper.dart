import 'package:crypto_benefit/app/data/sources/database/app_database.dart';
import 'package:crypto_benefit/app/data/sources/database/daos/transaction_kinds.dao.dart';
import 'package:crypto_benefit/app/domain/object/transaction.dart';
import 'package:crypto_benefit/app/domain/object/transaction_kind.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';

/// Call helping us with the mapping of transaction
class TransactionMapper {
  /// Access to the transaction kinds dao (for the mapping of the kind of each transactions)
  final _transactionKindsDao = inject<TransactionKindsDao>();

  /// Map a single csv row to a CsvTransaction
  TransactionEntity fromCsvRowToEntity(
          List<dynamic> csvRow, int fileId, int kindId) =>
      new TransactionEntity(
        id: null,
        fileId: fileId,
        timestamp: _getDateTime(csvRow[0]),
        description: csvRow[1],
        sourceCurrency: csvRow[2],
        sourceAmount: _getDouble(csvRow[3]),
        toCurrency: csvRow[4],
        toAmount: _getOptionalDouble(csvRow[5]),
        nativeCurrency: csvRow[6],
        nativeAmount: csvRow[7],
        usdAmount: _getDouble(csvRow[8]),
        rawKind: csvRow[9],
        kindId: kindId,
      );

  /// Fetch a datetime from field
  static DateTime _getDateTime(dynamic field) {
    if (field == null || field.runtimeType == DateTime) return field;
    if (field.runtimeType == String) return DateTime.parse(field);
    return null;
  }

  /// Fetch an optional double field
  static double _getOptionalDouble(dynamic field) {
    if (field == null || field.runtimeType == String) return null;

    return _getDouble(field);
  }

  /// Get a double for a specific field (can be also be an int)
  static double _getDouble(dynamic field) {
    if (field == null || field.runtimeType == double) return field;
    if (field.runtimeType == int) return field.toDouble();
    // In all the other case return null
    print("Unable to parse double value $field, returning null");
    return null;
  }

  /// Map list of transactions from entities
  Future<List<Transaction>> fromEntities(
      Iterable<TransactionEntity> transactionEntities) async {
    final List<Transaction> result = new List();
    for (var transactionEntity in transactionEntities.toList()) {
      result.add(await fromEntity(transactionEntity));
    }
    return result;
  }

  /// Map a transaction from entity
  Future<Transaction> fromEntity(TransactionEntity transactionEntity) async {
    if (transactionEntity == null) return null;

    // Fetch and map the associated transaction kind
    final TransactionKindEntity transactionKindEntity =
        await _transactionKindsDao.getbyId(transactionEntity.kindId);
    final TransactionKind transactionKind = new TransactionKind(
        id: transactionKindEntity.id, name: transactionKindEntity.name);

    // Build the transaction from the entity
    return Transaction(
      id: transactionEntity.id,
      fileId: transactionEntity.fileId,
      timestamp: transactionEntity.timestamp,
      description: transactionEntity.description,
      sourceCurrency: transactionEntity.sourceCurrency,
      sourceAmount: transactionEntity.sourceAmount,
      toCurrency: transactionEntity.toCurrency,
      toAmount: transactionEntity.toAmount,
      nativeCurrency: transactionEntity.nativeCurrency,
      nativeAmount: transactionEntity.nativeAmount,
      usdAmount: transactionEntity.usdAmount,
      rawKind: transactionEntity.rawKind,
      kind: transactionKind,
    );
  }
}

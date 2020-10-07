import 'package:crypto_benefit/app/data/sources/database/app_database.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';

/// Class helping us with the table for the transaction kinds
class TransactionKindsDao {
  AppDatabase _db = inject<AppDatabase>();

  /// Create or get a transaction kind
  Future<TransactionKindEntity> createOrGet(String name) async {
    // Try to find a transaction kind with that name
    final getTransactionKind = _db.select(_db.transactionKindsTable);
    getTransactionKind.where((tbl) => tbl.name.equals(name));
    final foundedTransactionKind = await getTransactionKind.getSingle();

    if (foundedTransactionKind != null) {
      return foundedTransactionKind;
    } else {
      print('No entity founded for the name $name');
    }

    // Create a new one if we havn't founded it
    final transactionKind = new TransactionKindEntity(id: null, name: name);
    final rowId = await _db
        .into(_db.transactionKindsTable)
        .insertOnConflictUpdate(transactionKind);
    print('Inserted the $name transaction kinds at row id $rowId');

    // Recall this method to get the transaction kind id also
    return createOrGet(name);
  }

  /// Get all of our imported transactions
  Future<List<TransactionKindEntity>> getTransactionKind() =>
      _db.select(_db.transactionKindsTable).get();

  /// Get a transactions kind from it's id
  Future<TransactionKindEntity> getbyId(int id) =>
      (_db.select(_db.transactionKindsTable)..where((tbl) => tbl.id.equals(id)))
          .getSingle();
}

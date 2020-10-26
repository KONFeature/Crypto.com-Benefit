import 'package:crypto_benefit/app/data/sources/database/app_database.dart';
import 'package:crypto_benefit/app/data/sources/database/tables/transaction_kinds.table.dart';
import 'package:moor/moor.dart';

part 'transaction_kinds.dao.g.dart';

/// Class helping us with the table for the transaction kinds
@UseDao(tables: [TransactionKindsTable])
class TransactionKindsDao extends DatabaseAccessor<AppDatabase>
    with _$TransactionKindsDaoMixin {
  /// Constructor that fetch the database
  TransactionKindsDao(AppDatabase db) : super(db);

  /// Create or get a transaction kind
  Future<TransactionKindEntity> createOrGet(String name) async {
    // Try to find a transaction kind with that name
    final foundedTransactionKind = await (select(transactionKindsTable)
          ..where((tbl) => tbl.name.equals(name)))
        .getSingle();

    if (foundedTransactionKind != null) {
      print(
          'A transaction kind already exist for the name $name, returning it');
      return foundedTransactionKind;
    } else {
      print('No transaction kind founded for the name $name, creating it');
    }

    // Create a new one if we havn't founded it
    final transactionKind = new TransactionKindEntity(id: null, name: name);
    final rowId = await into(transactionKindsTable)
        .insertOnConflictUpdate(transactionKind);
    print('Inserted the $name transaction kinds at row id $rowId');

    // Recall this method to also get the transaction kind id
    return createOrGet(name);
  }

  /// Get all of our imported transactions
  Future<List<TransactionKindEntity>> getTransactionKind() =>
      select(transactionKindsTable).get();

  /// Get a transactions kind from it's id
  Future<TransactionKindEntity> getbyId(int id) =>
      (select(transactionKindsTable)..where((tbl) => tbl.id.equals(id)))
          .getSingle();
}

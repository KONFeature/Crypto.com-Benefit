import 'package:crypto_benefit/app/data/sources/database/app_database.dart';
import 'package:crypto_benefit/app/domain/object/transaction_kind.dart';

/// Call helping us with the mapping of transaction kind
class TransactionKindMapper {
  /// Map list of transactions kind from entities
  Future<List<TransactionKind>> fromEntities(
      List<TransactionKindEntity> transactionKindEntities) async {
    final List<TransactionKind> result = new List();
    for (var transactionKindEntity in transactionKindEntities) {
      result.add(await fromEntity(transactionKindEntity));
    }
    return result;
  }

  /// Map a transaction kind from entity
  Future<TransactionKind> fromEntity(
      TransactionKindEntity transactionKindEntity) async {
    if (transactionKindEntity == null) return null;
    return new TransactionKind(
        id: transactionKindEntity.id, name: transactionKindEntity.name);
  }
}

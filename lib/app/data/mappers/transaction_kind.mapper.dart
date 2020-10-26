import 'package:crypto_benefit/app/data/sources/database/app_database.dart';
import 'package:crypto_benefit/app/domain/object/transaction_kind.dart';

/// Call helping us with the mapping of transaction kind
class TransactionKindMapper {
  /// Map list of transactions kind from entities
  List<TransactionKind> fromEntities(List<TransactionKindEntity> entities) =>
      entities.map((e) => fromEntity(e));

  /// Map a transaction kind from entity
  TransactionKind fromEntity(TransactionKindEntity transactionKindEntity) {
    if (transactionKindEntity == null) return null;
    return new TransactionKind(
        id: transactionKindEntity.id, name: transactionKindEntity.name);
  }
}

import 'package:crypto_benefit/app/data/sources/database/app_database.dart';

/// Representing a full statistic eneity (with joinded table)
class FullStatisticEntity {
  final int id;
  final String name;
  final int priority;
  final DateTime createdTimestamp;

  final List<TransactionKindEntity> transactionKindEntities;
  final List<ImportedFileEntity> importedFileEntites;

  FullStatisticEntity(this.id, this.name, this.priority, this.createdTimestamp,
      this.transactionKindEntities, this.importedFileEntites);
}

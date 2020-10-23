import 'package:crypto_benefit/app/data/sources/database/app_database.dart';
import 'package:crypto_benefit/app/domain/object/imported_file.dart';

/// Representing a full statistic eneity (with joinded table)
class FullStatisticEntity {
  final int id;
  final String name;
  final int priority;
  final DateTime createdTimestamp;

  final List<TransactionKindEntity> transactionKindEntities;
  final List<FileType> fileTypes;

  FullStatisticEntity(this.id, this.name, this.priority, this.createdTimestamp,
      this.transactionKindEntities, this.fileTypes);

  FullStatisticEntity.fromStat(
      StatisticEntity statEntity, this.transactionKindEntities, this.fileTypes)
      : this.id = statEntity.id,
        this.name = statEntity.name,
        this.priority = statEntity.priority,
        this.createdTimestamp = statEntity.createdTimestamp;
}

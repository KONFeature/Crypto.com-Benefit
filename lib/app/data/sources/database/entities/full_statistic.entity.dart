import 'package:crypto_benefit/app/data/sources/database/app_database.dart';
import 'package:crypto_benefit/app/domain/object/imported_file.dart';

/// Representing a full statistic entity (with joinded table)
class FullStatisticEntity {
  final int id;
  final String name;
  final int priority;
  final DateTime createdTimestamp;

  final FullFilterEntity filterEntity;

  FullStatisticEntity(
    this.id,
    this.name,
    this.priority,
    this.createdTimestamp,
    this.filterEntity,
  );

  FullStatisticEntity.fromStat(StatisticEntity statEntity, this.filterEntity)
      : this.id = statEntity.id,
        this.name = statEntity.name,
        this.priority = statEntity.priority,
        this.createdTimestamp = statEntity.createdTimestamp;
}

/// Representing a full statistic entity (with joinded table)
class FullFilterEntity {
  final int id;
  final List<TransactionKindEntity> transactionKindEntities;
  final List<FileType> fileTypes;

  FullFilterEntity(
    this.id,
    this.transactionKindEntities,
    this.fileTypes,
  );
}

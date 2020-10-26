import 'package:crypto_benefit/app/data/mappers/transaction_kind.mapper.dart';
import 'package:crypto_benefit/app/data/sources/database/entities/full_statistic.entity.dart';
import 'package:crypto_benefit/app/domain/object/imported_file.dart';
import 'package:crypto_benefit/app/domain/object/statistic/statistic.dart';
import 'package:crypto_benefit/app/domain/object/transaction_kind.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';

/// Call helping us with the mapping of statistic
class StatisticMapper {
  /// Mapper for the kinds, required because it's a child entity of stats
  final _kindMapper = inject<TransactionKindMapper>();

  /// Map list of statistics from entities
  List<Statistic> fromEntities(List<FullStatisticEntity> entities) =>
      entities.map((stat) => fromEntity(stat)).toList();

  // Map a full stat entity to a stat pojo
  Statistic fromEntity(FullStatisticEntity entity) {
    final kinds = entity.transactionKindEntities != null &&
            entity.transactionKindEntities.isNotEmpty
        ? _kindMapper.fromEntities(entity.transactionKindEntities)
        : List<TransactionKind>();
    final types = entity.fileTypes != null && entity.fileTypes.isNotEmpty
        ? entity.fileTypes
        : List<FileType>();
    return Statistic(name: entity.name, kinds: kinds, fileTypes: types);
  }
}

import 'package:crypto_benefit/app/data/mappers/transaction_kind.mapper.dart';
import 'package:crypto_benefit/app/data/sources/database/entities/full_statistic.entity.dart';
import 'package:crypto_benefit/app/domain/object/statistic/statistic.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';

/// Call helping us with the mapping of statistic
class StatisticMapper {
  /// Mapper for the kinds, required because it's a child entity of stats
  final _kindMapper = inject<TransactionKindMapper>();

  /// Map list of statistics from entities
  List<Statistic> fromEntities(List<FullStatisticEntity> entities) =>
      entities.map((e) => fromEntity(e)).toList();

  // Map a full stat entity to a stat pojo
  Statistic fromEntity(FullStatisticEntity entity) => Statistic(
      name: entity.name,
      kinds: _kindMapper.fromEntities(entity.transactionKindEntities),
      fileTypes: entity.fileTypes);
}

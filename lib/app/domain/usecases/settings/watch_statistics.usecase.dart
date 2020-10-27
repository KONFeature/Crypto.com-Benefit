import 'package:crypto_benefit/app/domain/object/statistic/statistic.dart';
import 'package:crypto_benefit/app/domain/repositories/statistic.repository.dart';
import 'package:crypto_benefit/app/domain/usecases/usecase.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';

/// Use case used to fetch all the imported file
class WatchStatisticsUseCase
    implements StreamUseCase<Iterable<Statistic>, void> {
  final _statisticRepository = inject<IStatisticRepository>();

  @override
  Stream<List<Statistic>> watch(void params) =>
      _statisticRepository.watchStatistics().map((stats) => stats.toList());
}

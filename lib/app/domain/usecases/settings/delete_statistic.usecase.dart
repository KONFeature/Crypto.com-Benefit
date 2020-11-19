import 'package:crypto_benefit/app/domain/object/statistic/statistic.dart';
import 'package:crypto_benefit/app/domain/repositories/statistic.repository.dart';
import 'package:crypto_benefit/app/domain/usecases/usecase.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';

/// Use case used to delete a statistic
class DeleteStatisticUseCase
    implements BaseUseCase<void, DeleteStatisticParams> {
  final _statisticRepository = inject<IStatisticRepository>();

  @override
  Future<void> execute(DeleteStatisticParams params) async {
    print('Delete the statistic ${params.statistic.name}');
    await _statisticRepository.deleteStatistic(params.statistic.id);
  }
}

/// Params for our use case
class DeleteStatisticParams {
  final Statistic statistic;

  DeleteStatisticParams({this.statistic});
}

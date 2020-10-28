import 'package:crypto_benefit/app/domain/object/imported_file.dart';
import 'package:crypto_benefit/app/domain/object/transaction_kind.dart';
import 'package:crypto_benefit/app/domain/repositories/statistic.repository.dart';
import 'package:crypto_benefit/app/domain/usecases/usecase.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';

/// Use case used to create a new statistic object
class UpdateStatisticUseCase
    implements BaseUseCase<void, UpdateStatisticParams> {
  final _statisticRepository = inject<IStatisticRepository>();

  @override
  Future<void> execute(UpdateStatisticParams params) async {
    // Update the statistic name
    await _statisticRepository.updateStatistic(params.id, params.name);

    // Update the kinds and types
    await _statisticRepository.updateStatisticFilter(
        params.id, params.kinds.map((kind) => kind.id).toList(), params.types);
  }
}

/// Params for our use case
class UpdateStatisticParams {
  final int id;
  final String name;
  final List<TransactionKind> kinds;
  final List<FileType> types;
  UpdateStatisticParams({this.id, this.name, this.kinds, this.types});
}

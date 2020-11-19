import 'package:crypto_benefit/app/domain/object/imported_file.dart';
import 'package:crypto_benefit/app/domain/object/transaction_kind.dart';
import 'package:crypto_benefit/app/domain/repositories/statistic.repository.dart';
import 'package:crypto_benefit/app/domain/usecases/usecase.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';

/// Use case used to create a new statistic object
class CreateStatisticUseCase
    implements BaseUseCase<void, CreateStatisticParams> {
  final _statisticRepository = inject<IStatisticRepository>();

  @override
  Future<void> execute(CreateStatisticParams params) async {
    // Create a new statistic object
    final newStatisticId =
        await _statisticRepository.createStatistic(params.name);

    // Add it the kinds and types
    await _statisticRepository.updateStatisticFilter(newStatisticId,
        params.kinds.map((kind) => kind.id).toList(), params.types);
  }
}

/// Params for our use case
class CreateStatisticParams {
  final String name;
  final List<TransactionKind> kinds;
  final List<FileType> types;

  CreateStatisticParams({this.name, this.kinds, this.types});
}

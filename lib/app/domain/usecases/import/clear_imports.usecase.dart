import 'package:crypto_benefit/app/domain/repositories/import_file.repository.dart';
import 'package:crypto_benefit/app/domain/usecases/usecase.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';

/// Use case used to clear all the imports done on the app
class ClearImportsUseCase implements BaseUseCase<void, void> {
  final _importFileRepository = inject<IImportFileRepository>();

  @override
  Future<void> execute(void params) async {
    // Clear the imported files
    await _importFileRepository.clearImports();
  }
}

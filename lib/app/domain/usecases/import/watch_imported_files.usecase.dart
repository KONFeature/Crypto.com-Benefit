import 'package:crypto_benefit/app/domain/object/imported_file.dart';
import 'package:crypto_benefit/app/domain/repositories/import_file.repository.dart';
import 'package:crypto_benefit/app/domain/usecases/usecase.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';

/// Use case used to fetch all the imported file
class WatchImportedFileUseCase
    implements StreamUseCase<List<ImportedFile>, void> {
  final _importFileRepository = inject<IImportFileRepository>();

  @override
  Stream<List<ImportedFile>> watch(void params) =>
      _importFileRepository.watchImportedFiles();
}

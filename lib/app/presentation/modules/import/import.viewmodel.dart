import 'package:crypto_benefit/app/domain/usecases/import/clear_imports.usecase.dart';
import 'package:crypto_benefit/app/domain/usecases/import/watch_imported_files.usecase.dart';
import 'package:crypto_benefit/app/domain/usecases/import/import_file.usecase.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';
import 'package:flutter_document_picker/flutter_document_picker.dart';
import 'package:mobx/mobx.dart';

part 'import.viewmodel.g.dart';

class ImportViewModel = _ImportViewModelBase with _$ImportViewModel;

/// The view model for our import file view.
abstract class _ImportViewModelBase with Store {
  /// Our use cases for this view model
  final _importFileUseCase = inject<ImportFileUseCase>();
  final _clearImportUseCase = inject<ClearImportsUseCase>();
  final _watchImportedFileUseCase = inject<WatchImportedFileUseCase>();

  @observable
  ObservableStream<Iterable> importedFilesStream;

  _ImportViewModelBase() {
    // Listen to our imported file stream
    importedFilesStream = _watchImportedFileUseCase.watch(null).asObservable();
  }

  @action
  import() async {
    // TODO : Try catch or onError ?
    // Launch file picking actions
    FlutterDocumentPickerParams filePickerParams = FlutterDocumentPickerParams(
      allowedFileExtensions: ['csv'],
      allowedMimeTypes: ['text/csv'],
    );
    final csvFilePath =
        await FlutterDocumentPicker.openDocument(params: filePickerParams);

    // Import the picked file in the app
    await _importFileUseCase.execute(ImportFileParams(filePath: csvFilePath));
  }

  @action
  clearImports() async {
    // TODO : Try catch or onError ?
    // Launch the clear import use case
    await _clearImportUseCase.execute(null);
  }
}

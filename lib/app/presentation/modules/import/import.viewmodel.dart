
import 'package:crypto_benefit/app/domain/usecases/import/clear_imports.usecase.dart';
import 'package:crypto_benefit/app/domain/usecases/import/import_file.usecase.dart';
import 'package:crypto_benefit/app/domain/usecases/import/watch_imported_files.usecase.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';
import 'package:flutter_document_picker/flutter_document_picker.dart';
import 'package:mobx/mobx.dart';

part 'import.viewmodel.g.dart';

class ImportViewModel = _ImportViewModelBase with _$ImportViewModel;

/// The view model for our import page.
abstract class _ImportViewModelBase with Store {
  /// Use case to import a new file
  final _importFileUseCase = inject<ImportFileUseCase>();
  /// Use case to watch the current imported file
  final _watchImportedFileUseCase = inject<WatchImportedFileUseCase>();
  /// Use case to clear and all the imported use case
  final _clearImportUseCase = inject<ClearImportsUseCase>();

  @observable
  ObservableStream<Iterable> importedFilesStream;

  @observable
  Observable<String> errorMessage = Observable(null);

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

    // Try to import the picked file in the app
    try {
      await _importFileUseCase.execute(ImportFileParams(filePath: csvFilePath));
    } catch (exception) {
      print("Error occured during the file import $exception");
      errorMessage.value =
          "Error occured during the import of type : ${exception.runtimeType}";
    }
  }

  @action
  clearImports() async {
    // TODO : Try catch or onError ?
    // Launch the clear import use case
    await _clearImportUseCase.execute(null);
  }
}

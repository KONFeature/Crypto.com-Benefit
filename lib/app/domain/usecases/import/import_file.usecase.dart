import 'dart:io';

import 'package:crypto_benefit/app/domain/repositories/import_file.repository.dart';
import 'package:crypto_benefit/app/domain/repositories/transaction.repository.dart';
import 'package:crypto_benefit/app/domain/repositories/transaction_kind.repository.dart';
import 'package:crypto_benefit/app/domain/usecases/usecase.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';
import 'package:csv/csv.dart';

/// Use case used to import a list of transactions from a file, take a filepath as params
class ImportFileUseCase implements BaseUseCase<void, ImportFileParams> {
  final _importFileRepository = inject<IImportFileRepository>();
  final _transactionKindRepository = inject<ITransactionKindRepository>();
  final _transactionRepository = inject<ITransactionRepository>();

  @override
  Future<void> execute(ImportFileParams params) async {
    // Get the file from the filepath
    final csvFile = new File(params.filePath);

    // Send the selected file to the repository for the import.
    final importFiledId = await _importFileRepository.importFile(csvFile);

    // Get the file from the filepath and read it as map of csv rows
    final fileContent = await csvFile.readAsString();
    final csvRows = const CsvToListConverter()
        .convert(fileContent, fieldDelimiter: ',', eol: '\n');

    // Remove the header line of the csv rows and trim the 9 rows if it's a string type
    csvRows.removeAt(0);
    csvRows.forEach((row) {
      if (row[9].runtimeType == String) {
        row[9] = row[9].trim();
      }
    });

    // Extract the list of transactions kinds and send them to the transaction kinds repository
    final rawKinds = csvRows.map((row) => row[9]).toList();
    final kindsIdMap =
        await _transactionKindRepository.putTransactionsKinds(rawKinds);

    // Convert the file content to transactions
    _transactionRepository.importFromCsv(csvRows, importFiledId, kindsIdMap);
  }
}

/// Params for our use case
class ImportFileParams {
  final String filePath;
  ImportFileParams({this.filePath});
}

import 'dart:io';

import 'package:crypto_benefit/app/domain/object/imported_file.dart';

/// Interface for the import file repository
abstract class IImportFileRepository {
  /// Import a new csv file (return the imported file id)
  Future<int> importFile(File path);

  /// Clear all the imports
  Future<void> clearImports();

  /// Stream used to get all of our files with their associated transactions
  Stream<Iterable<ImportedFile>> watchImportedFiles();

  /// Get a file name from it's id
  Future<ImportedFile> getFileById(int fileId);
}

import 'dart:io';

import 'package:crypto_benefit/app/data/mappers/imported_file.mapper.dart';
import 'package:crypto_benefit/app/data/sources/database/app_database.dart';
import 'package:crypto_benefit/app/data/sources/database/daos/imported_files.dao.dart';
import 'package:crypto_benefit/app/domain/exceptions/import_file.exceptions.dart';
import 'package:crypto_benefit/app/domain/object/imported_file.dart';
import 'package:crypto_benefit/app/domain/repositories/import_file.repository.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';

/// Implementation of the transaction repository
class ImportFileRepository implements IImportFileRepository {
  /// All of our different filename regex organized by file type
  static const FILETYPE_REGEX_FILENAME_MAP = <FileType, String>{
    FileType.cardTransaction: 'card_transactions_record_*',
    FileType.fiatTransactions: 'fiat_transactions_record_*',
    FileType.cryptoTransactions: 'crypto_transactions_record_*',
  };

  /// Regex used to extract the generated timestamp of the file
  static const REGEX_GENERATED_TIME_FILENAME = '\\w+_(\\d{8}_\\d{6}).csv';

  /// DAO we will use
  ImportedFilesDao _importedFilesDao = inject<ImportedFilesDao>();

  /// Mapper
  ImportedFileMapper _importedfileMapper = inject<ImportedFileMapper>();

  @override
  Future<int> importFile(File file) async {
    // Get the filename from the path of the file
    final filename = file.uri.pathSegments.last;

    // Check we don't already have a file imported with this filename
    if (await _importedFilesDao.isFilenameAlreadyPresent(filename))
      throw new FileAlreadyImportedException();

    // Get the type and generated timestamp of the file from the filename
    final type = _getFileTypeFromFilename(filename);
    final generatedTimeStamp = _getGeneratedTimestampFromFilename(filename);

    // Build the entity
    final importedFile = new ImportedFileEntity(
        id: null,
        filename: filename,
        typeIndex: type.index,
        generatedTimestamp: generatedTimeStamp,
        importedTimestamp: DateTime.now());

    // Insert the file in the database
    return await _importedFilesDao.save(importedFile);
  }

  /// Get the file type from the filename
  FileType _getFileTypeFromFilename(String filename) {
    // Check for each entry we got in our filetype by filename regex map
    for (var typeFilenameEntry in FILETYPE_REGEX_FILENAME_MAP.entries) {
      RegExp filenameRegex = RegExp(typeFilenameEntry.value,
          caseSensitive: false, multiLine: false);
      if (filenameRegex.hasMatch(filename)) return typeFilenameEntry.key;
    }
    // If we got here we throw an exception
    throw new UnableToReadFileTypeException();
  }

  /// Get the generated timestamp of a file from it's filename
  DateTime _getGeneratedTimestampFromFilename(String filename) {
    // Buold the regex expression we will use
    RegExp generatedTimeRegex = RegExp(REGEX_GENERATED_TIME_FILENAME,
        caseSensitive: false, multiLine: false);
    // If we havn't any match in our filename for the specified timestamp we throw an exception
    if (!generatedTimeRegex.hasMatch(filename))
      throw new UnableToReadGeneratedTimestampException();
    // Extract the matching group of our regex and parse it to datetime
    final generatedTimeString =
        generatedTimeRegex.firstMatch(filename).group(1);
    final parsedDate = DateTime.parse(generatedTimeString.replaceAll('_', 'T'));

    // If we arn't able to parse the date we throw an exception
    if (parsedDate == null) throw new UnableToReadGeneratedTimestampException();
    // Else return it
    return parsedDate;
  }

  @override
  Future<void> clearImports() async {
    final deleteCount = await _importedFilesDao.removeAll();
    print('Successfully deleted $deleteCount imported files from the database');
  }

  @override
  Stream<List<ImportedFile>> importedFilesStream() => _importedFilesDao
      .getImportedFilesStream()
      .asyncMap((importedFilesEntities) async =>
          _importedfileMapper.fromEntities(importedFilesEntities));
}

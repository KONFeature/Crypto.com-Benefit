import 'package:crypto_benefit/app/data/sources/database/app_database.dart';
import 'package:crypto_benefit/app/data/sources/database/tables/imported_files.table.dart';
import 'package:moor/moor.dart';

part 'imported_files.dao.g.dart';

/// Class helping us with the table for the imported files
@UseDao(tables: [ImportedFilesTable])
class ImportedFilesDao extends DatabaseAccessor<AppDatabase>
    with _$ImportedFilesDaoMixin {
  /// Constructor that fetch the database
  ImportedFilesDao(AppDatabase db) : super(db);

  /// Check if a filename is already present in our imported files table
  Future<bool> isFilenameAlreadyPresent(String filename) async {
    // TODO : Create a count expression, query it, and check it's superior to 0
    final selectByFilenameResult = await (select(importedFilesTable)
          ..where((tbl) => tbl.filename.equals(filename)))
        .get();
    return selectByFilenameResult.length > 0;
  }

  /// Insert a new imported file and return it's id
  Future<int> save(ImportedFileEntity entity) async {
    // Insert our imported file
    final fileRowId = await into(importedFilesTable).insert(entity);
    print('Successfully inserted a new file import with the row id $fileRowId');
    // Return it's id from it's filename
    return await _getIdByFilename(entity.filename);
  }

  /// Retreive an imported file id from it's filename
  Future<int> _getIdByFilename(String filename) async {
    final retreivedFile = await (select(importedFilesTable)
          ..where((tbl) => tbl.filename.equals(filename)))
        .getSingle();
    return retreivedFile?.id ?? null;
  }

  /// Retreive an imported file from it's id
  Future<ImportedFileEntity> getById(int id) =>
      (select(importedFilesTable)..where((tbl) => tbl.id.equals(id)))
          .getSingle();

  /// Remove all the file entries
  Future<int> removeAll() async => delete(importedFilesTable).go();

  /// Get a Stream of al the current files we got in the database
  Stream<List<ImportedFileEntity>> watchImportedFiles() =>
      select(importedFilesTable).watch();
}

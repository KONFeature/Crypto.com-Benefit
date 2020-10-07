import 'package:crypto_benefit/app/data/sources/database/app_database.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';

/// Class helping us with the table for the imported files
class ImportedFilesDao {
  final _db = inject<AppDatabase>();
  $ImportedFilesTableTable get _importedFilesTable => _db.importedFilesTable;

  /// Check if a filename is already present in our imported files table
  Future<bool> isFilenameAlreadyPresent(String filename) async {
    // TODO : Create a count expression, query it, and check it's superior to 0
    final selectByFilenameQuery = _db.select(_importedFilesTable)
      ..where((tbl) => tbl.filename.equals(filename));
    final selectByFilenameResult = await selectByFilenameQuery.get();
    return selectByFilenameResult.length > 0;
  }

  /// Insert a new imported file and return it's id
  Future<int> save(ImportedFileEntity entity) async {
    // Insert our imported file
    final fileRowId = await _db.into(_importedFilesTable).insert(entity);
    print('Successfully inserted a new file import with the row id $fileRowId');
    // Return it's id from it's filename
    return await _getIdByFilename(entity.filename);
  }

  /// Retreive an imported file id from it's filename
  Future<int> _getIdByFilename(String filename) async {
    final getByFilenameQuery = _db.select(_db.importedFilesTable);
    getByFilenameQuery.where((table) => table.filename.equals(filename));
    final retreivedFile = await getByFilenameQuery.getSingle();
    return retreivedFile?.id ?? null;
  }

  /// Retreive an imported file from it's id
  Future<ImportedFileEntity> getById(int id) async {
    final getByIdQuery = _db.select(_db.importedFilesTable);
    getByIdQuery.where((table) => table.id.equals(id));
    final retreivedFile = await getByIdQuery.getSingle();
    return retreivedFile;
  }

  /// Remove all the file entries
  Future<int> removeAll() async => _db.delete(_db.importedFilesTable).go();

  /// Get a Stream of al the current files we got in the database
  Stream<List<ImportedFileEntity>> getImportedFilesStream() =>
      _db.select(_db.importedFilesTable).watch();
}

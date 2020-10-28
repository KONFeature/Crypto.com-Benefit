import 'package:crypto_benefit/app/data/sources/database/app_database.dart';
import 'package:crypto_benefit/app/domain/object/imported_file.dart';

/// Call helping us with the mapping of imported file
class ImportedFileMapper {
  /// Map a imported file from entity
  Iterable<ImportedFile> fromEntities(
          Iterable<ImportedFileEntity> importedFilesEntities) =>
      importedFilesEntities.map((entity) => fromEntity(entity));

  ImportedFile fromEntity(ImportedFileEntity importedFileEntity) =>
      ImportedFile(
          id: importedFileEntity.id,
          filename: importedFileEntity.filename,
          type: importedFileEntity.type,
          generatedTimestamp: importedFileEntity.generatedTimestamp,
          importedTimestamp: importedFileEntity.importedTimestamp);
}

import 'package:crypto_benefit/app/domain/object/imported_file.dart';
import 'package:moor/moor.dart';

/// Represent the imported file entity
@DataClassName("ImportedFileEntity")
class ImportedFilesTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get filename => text().customConstraint('UNIQUE')();

  IntColumn get type => intEnum<FileType>()();

  DateTimeColumn get generatedTimestamp => dateTime()();

  DateTimeColumn get importedTimestamp => dateTime()();
}

import 'package:moor/moor.dart';

/// Represent the imported file entity
@DataClassName("ImportedFileEntity")
class ImportedFilesTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get filename => text().customConstraint('UNIQUE')();
  IntColumn get typeIndex => integer()();
  DateTimeColumn get generatedTimestamp => dateTime()();
  DateTimeColumn get importedTimestamp => dateTime()();
}

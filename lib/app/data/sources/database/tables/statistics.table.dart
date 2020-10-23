import 'package:crypto_benefit/app/domain/object/imported_file.dart';
import 'package:moor/moor.dart';

/// Represent the statistics table
@DataClassName("StatisticEntity")
class StatisticTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().customConstraint('UNIQUE')();
  IntColumn get priority => integer().nullable()();
  DateTimeColumn get createdTimestamp => dateTime()();
}

/// Represent the join table between statistic and kind
@DataClassName("StatisticKindEntity")
class StatisticKindsTable extends Table {
  IntColumn get statisticId =>
      integer().customConstraint("NOT NULL REFERENCES statistic_table(id)")();
  IntColumn get kindId => integer()
      .customConstraint("NOT NULL REFERENCES transaction_kinds_table(id)")();

  @override
  Set<Column> get primaryKey => {statisticId, kindId};
}

/// Represent the join table between statistic and imported file
@DataClassName("StatisticFileEntity")
class StatisticFilesTable extends Table {
  IntColumn get statisticId =>
      integer().customConstraint("NOT NULL REFERENCES statistic_table(id)")();
  IntColumn get fileType => intEnum<FileType>()();

  @override
  Set<Column> get primaryKey => {statisticId, fileType};
}

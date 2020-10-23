import 'package:moor/moor.dart';

/// Represent the statistics table
@DataClassName("StatisticEntity")
class StatisticTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().customConstraint('UNIQUE')();
  IntColumn get priority => integer()();
  DateTimeColumn get createdTimestamp => dateTime()();
}

/// Represent the join table between statistic and kind
@DataClassName("StatisticKindEntity")
class StatisticKindsTable extends Table {
  IntColumn get statisticId => integer()();
  IntColumn get kindId => integer()();

  /// Custon constraints on the table level for composite unique constraint
  @override
  List<String> get customConstraints => [
        'FOREIGN KEY (statistic_id) REFERENCES statistic_table (id)', // Foreign key on the statistics table
        'FOREIGN KEY (kind_id) REFERENCES transaction_kinds_table (id)' // Foreign key on the transaction kinds table
      ];
}

/// Represent the join table between statistic and imported file
@DataClassName("StatisticFileEntity")
class StatisticFilesTable extends Table {
  IntColumn get statisticId => integer()();
  IntColumn get fileId => integer()();

  /// Custon constraints on the table level for composite unique constraint
  @override
  List<String> get customConstraints => [
        'FOREIGN KEY (statistic_id) REFERENCES statistic_table (id)', // Foreign key on the statistics table
        'FOREIGN KEY (file_id) REFERENCES imported_files_table (id)' // Foreign key on the imported files table
      ];
}

import 'package:crypto_benefit/app/domain/object/imported_file.dart';
import 'package:moor/moor.dart';

/// Represent the statistics table
@DataClassName("StatisticEntity")
class StatisticTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().customConstraint('UNIQUE')();

  IntColumn get priority => integer().nullable()();

  DateTimeColumn get createdTimestamp => dateTime()();

  IntColumn get filterId => integer().customConstraint(
      "REFERENCES filter_table(id) ON UPDATE CASCADE ON DELETE SET NULL")();
}

/// Represent the statistics table
@DataClassName("FilterEntity")
class FilterTable extends Table {
  IntColumn get id => integer().autoIncrement()();
}

/// Represent the join table between statistic and kind
@DataClassName("FilterTransactionKindEntry")
class FilterTransactionKindTable extends Table {
  IntColumn get filterId => integer().customConstraint(
      "NOT NULL REFERENCES filter_table(id) ON UPDATE CASCADE ON DELETE CASCADE")();

  IntColumn get kindId => integer().customConstraint(
      "NOT NULL REFERENCES transaction_kinds_table(id) ON UPDATE CASCADE ON DELETE CASCADE")();

  @override
  Set<Column> get primaryKey => {filterId, kindId};
}

/// Represent the join table between statistic and imported file
@DataClassName("FilterFileTypeEntry")
class FilterFileTypeTable extends Table {
  IntColumn get filterId => integer().customConstraint(
      "NOT NULL REFERENCES filter_table(id) ON UPDATE CASCADE ON DELETE CASCADE")();

  IntColumn get fileType => intEnum<FileType>()();

  @override
  Set<Column> get primaryKey => {filterId, fileType};
}

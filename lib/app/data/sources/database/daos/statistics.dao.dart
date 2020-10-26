import 'package:crypto_benefit/app/data/sources/database/app_database.dart';
import 'package:crypto_benefit/app/data/sources/database/entities/full_statistic.entity.dart';
import 'package:crypto_benefit/app/data/sources/database/tables/statistics.table.dart';
import 'package:crypto_benefit/app/domain/object/imported_file.dart';
import 'package:moor/moor.dart';
import 'package:rxdart/rxdart.dart';

part 'statistics.dao.g.dart';

/// Class helping us with the table for the statistics
@UseDao(tables: [StatisticTable, StatisticKindsTable, StatisticFilesTable])
class StatisticsDao extends DatabaseAccessor<AppDatabase>
    with _$StatisticsDaoMixin {
  /// Constructor that fetch the database
  StatisticsDao(AppDatabase db) : super(db);

  /// Retreive all the statistic we got in the database
  Stream<List<FullStatisticEntity>> watchAllStatistics() {
    final statsStream = select(statisticTable).watch();

    return statsStream.switchMap((stats) {
      // Get the id of all of our stats
      final idToStat = {for (var stat in stats) stat.id: stat};
      final statIds = idToStat.keys;

      // Query to get the associated kinds
      final kindEntriesQuery = select(statisticKindsTable).join([
        innerJoin(db.transactionKindsTable,
            db.transactionKindsTable.id.equalsExp(statisticKindsTable.kindId))
      ])
        ..where(statisticKindsTable.statisticId.isIn(statIds));

      // Query to get the associated file types
      final fileTypesQuery = select(statisticFilesTable)
        ..where((tbl) => tbl.statisticId.isIn(statIds));

      // Observe the kind entries query
      return kindEntriesQuery.watch().switchMap((kindRows) {
        // Map the kind entries and associate them with the stat id
        final idToKind = <int, List<TransactionKindEntity>>{};
        for (var row in kindRows) {
          final item = row.readTable(db.transactionKindsTable);
          final id = row.readTable(statisticKindsTable).statisticId;
          idToKind.putIfAbsent(id, () => []).add(item);
        }

        // Do the same things for file (Observe the entries and map them)
        return fileTypesQuery.watch().map((typeRows) {
          // Create the map of stat id to list of associated file types
          final idToFileType = <int, List<FileType>>{};
          for (var typeRow in typeRows) {
            final item = typeRow.fileType;
            final id = typeRow.statisticId;
            idToFileType.putIfAbsent(id, () => []).add(item);
          }

          // Then build and return our completed object for the 3 map
          return [
            for (var id in statIds)
              FullStatisticEntity.fromStat(
                  idToStat[id], idToKind[id], idToFileType[id])
          ];
        });
      });
    });
  }

  /// Save a statistic entity
  Future<int> insert(StatisticEntity entity) async {
    // Insert a new stat entity
    await into(statisticTable).insert(entity); // TODO : replace if conflict ??
    // Find it's id from it's name
    return (await _getByName(entity.name)).id;
  }

  /// Delete statistic entity from the database, return the deleted count
  Future<int> deleteStat(int statId) =>
      (delete(statisticTable)..where((tbl) => tbl.id.equals(statId))).go();

  /// Retreive a statistic entity from it's name
  Future<StatisticEntity> _getByName(String name) =>
      (select(statisticTable)..where((tbl) => tbl.name.equals(name)))
          .getSingle();

  /// Update the list of transactions kinds for a stat
  Future<void> updateKindsForStat(int statId, List<int> kindIds) async {
    // For each kinds id
    for (var kindId in kindIds) {
      // Build our stat kind entities
      StatisticKindEntity entry =
          StatisticKindEntity(statisticId: statId, kindId: kindId);
      // Insert it
      await into(statisticKindsTable).insert(entry, mode: InsertMode.replace);
    }
  }

  /// Update the list of transactions kinds for a stat
  Future<void> updateFileTypesForStat(int statId, List<FileType> types) async {
    // For each kinds id
    for (var type in types) {
      // Build our stat kind entities
      StatisticFileEntity entry =
          StatisticFileEntity(statisticId: statId, fileType: type);
      // Insert it
      await into(statisticFilesTable).insert(entry, mode: InsertMode.replace);
    }
  }
}

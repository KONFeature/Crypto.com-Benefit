import 'package:crypto_benefit/app/data/sources/database/app_database.dart';
import 'package:crypto_benefit/app/data/sources/database/entities/full_statistic.entity.dart';
import 'package:crypto_benefit/app/data/sources/database/tables/statistics.table.dart';
import 'package:crypto_benefit/app/domain/object/imported_file.dart';
import 'package:moor/moor.dart';
import 'package:rxdart/rxdart.dart';

part 'statistics.dao.g.dart';

/// Class helping us with the table for the statistics
@UseDao(tables: [
  StatisticTable,
  FilterTable,
  FilterTransactionKindTable,
  FilterFileTypeTable
])
class StatisticsDao extends DatabaseAccessor<AppDatabase>
    with _$StatisticsDaoMixin {
  /// Constructor that fetch the database
  StatisticsDao(AppDatabase db) : super(db);

  /// Retreive all the statistic we got in the database
  Stream<Iterable<FullStatisticEntity>> watchAllStatistics() {
    // Watch all of our stats
    return select(statisticTable).watch().switchMap((stats) {
      // Get the id of all of our stats
      final idToStats = {for (var stat in stats) stat.id: stat};

      // Get the stream for the filter of each one of our stat
      Stream<Map<int, FullFilterEntity>> filtersStream =
          _watchFilterForStatistics(stats);

      // Merge all the filter stream
      return filtersStream.map((idToFilters) {
        // And then use the stream
        return idToStats.keys.map((statId) {
          return FullStatisticEntity.fromStat(
              idToStats[statId], idToFilters[statId]);
        }).toList();
      });
    });
  }

  /// Create a stream for all the filter for given stats id
  Stream<Map<int, FullFilterEntity>> _watchFilterForStatistics(
      List<StatisticEntity> statistics) {
    // Create stream for each one of our stat object
    final filterIdToStatId = {
      for (var stat in statistics) stat.filterId: stat.id
    };
    final filterIds = filterIdToStatId.keys;

    // Query to get the associated kinds
    final kindEntriesQuery = select(filterTransactionKindTable).join([
      innerJoin(
          db.transactionKindsTable,
          db.transactionKindsTable.id
              .equalsExp(filterTransactionKindTable.kindId))
    ])
      ..where(filterTransactionKindTable.filterId.isIn(filterIds));

    // Query to get the associated file types
    final fileTypesQuery = select(filterFileTypeTable)
      ..where((tbl) => tbl.filterId.isIn(filterIds));

    // Observe the kind entries query
    return kindEntriesQuery.watch().switchMap((kindRows) {
      // Map the kind entries and associate them with the stat id
      final idToKind = <int, List<TransactionKindEntity>>{};
      for (var row in kindRows) {
        final item = row.readTable(db.transactionKindsTable);
        final id = row.readTable(filterTransactionKindTable).filterId;
        idToKind.putIfAbsent(id, () => []).add(item);
      }

      // Do the same things for file (Observe the entries and map them)
      return fileTypesQuery.watch().map((typeRows) {
        // Create the map of stat id to list of associated file types
        final idToFileType = <int, List<FileType>>{};
        for (var typeRow in typeRows) {
          final item = typeRow.fileType;
          final id = typeRow.filterId;
          idToFileType.putIfAbsent(id, () => []).add(item);
        }

        // Create the map of stat id to filter
        Map<int, FullFilterEntity> fullStatisticEntities = Map();
        for (var filterId in filterIds) {
          fullStatisticEntities.putIfAbsent(
              filterIdToStatId[filterId],
              () => FullFilterEntity(
                  filterId, idToKind[filterId], idToFileType[filterId]));
        }
        // And then return it
        return fullStatisticEntities;
      });
    });
  }

  /// Create a simple filter entity
  Future<int> createFilter() =>
      into(filterTable).insert(FilterEntity(id: null));

  /// Save a statistic entity
  Future<int> insert(StatisticEntity entity) async {
    // Insert a new stat entity
    await into(statisticTable).insert(entity);
    // Find it's id from it's name
    return (await _getByName(entity.name)).id;
  }

  /// Delete statistic entity from the database, return the deleted count
  Future<int> deleteStat(int statId) =>
      (delete(statisticTable)..where((tbl) => tbl.id.equals(statId))).go();

  /// Retreive a statistic entity from it's id
  Future<StatisticEntity> getById(int id) =>
      (select(statisticTable)..where((tbl) => tbl.id.equals(id))).getSingle();

  /// Update the statistic name
  Future<void> updateName(int id, String name) =>
      (update(statisticTable)..where((tbl) => tbl.id.equals(id)))
          .write(StatisticTableCompanion(name: Value(name)));

  /// Retreive a statistic entity from it's name
  Future<StatisticEntity> _getByName(String name) =>
      (select(statisticTable)..where((tbl) => tbl.name.equals(name)))
          .getSingle();

  /// Update the list of transactions kinds for a filter
  Future<void> updateKindsForFilter(int filterId, List<int> kindIds) async {
    // Clear all the previously associated kind
    (delete(filterTransactionKindTable)
          ..where((tbl) => tbl.filterId.equals(filterId)))
        .go();
    // For each kinds id
    for (var kindId in kindIds) {
      // Build our stat kind entities
      FilterTransactionKindEntry entry =
          FilterTransactionKindEntry(filterId: filterId, kindId: kindId);
      // Insert it
      await into(filterTransactionKindTable)
          .insert(entry, mode: InsertMode.replace);
    }
  }

  /// Update the list of transactions kinds for a filter
  Future<void> updateFileTypesForFilter(
      int filterId, List<FileType> types) async {
    // Clear all the previously associated types
    (delete(filterFileTypeTable)..where((tbl) => tbl.filterId.equals(filterId)))
        .go();
    // For each kinds id
    for (var type in types) {
      // Build our stat kind entities
      FilterFileTypeEntry entry =
          FilterFileTypeEntry(filterId: filterId, fileType: type);
      // Insert it
      await into(filterFileTypeTable).insert(entry, mode: InsertMode.replace);
    }
  }
}

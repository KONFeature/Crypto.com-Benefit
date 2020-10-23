import 'package:crypto_benefit/app/data/sources/database/app_database.dart';
import 'package:crypto_benefit/app/data/sources/database/entities/full_statistic.entity.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';

/// Class helping us with the table for the statistics
class StatisticsDao {
  final _db = inject<AppDatabase>();

  $StatisticTableTable get _statisticTable => _db.statisticTable;
  $StatisticKindsTableTable get _statisticKindTable => _db.statisticKindsTable;
  $StatisticFilesTableTable get _statisticFileTable => _db.statisticFilesTable;

  /// Retreive all the statistic we got in the database
  Future<List<FullStatisticEntity>> watchAllStatistics() async {
    return List();
  }
}

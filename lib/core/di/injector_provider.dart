import 'package:crypto_benefit/app/data/mappers/imported_file.mapper.dart';
import 'package:crypto_benefit/app/data/mappers/statistic.mapper.dart';
import 'package:crypto_benefit/app/data/mappers/transaction.mapper.dart';
import 'package:crypto_benefit/app/data/mappers/transaction_kind.mapper.dart';
import 'package:crypto_benefit/app/data/repositories/import_file.impl.repository.dart';
import 'package:crypto_benefit/app/data/repositories/statistic.impl.repository.dart';
import 'package:crypto_benefit/app/data/repositories/transaction.impl.repository.dart';
import 'package:crypto_benefit/app/data/repositories/transaction_kind.impl.repository.dart';
import 'package:crypto_benefit/app/data/sources/database/app_database.dart';
import 'package:crypto_benefit/app/data/sources/database/daos/imported_files.dao.dart';
import 'package:crypto_benefit/app/data/sources/database/daos/statistics.dao.dart';
import 'package:crypto_benefit/app/data/sources/database/daos/transaction_kinds.dao.dart';
import 'package:crypto_benefit/app/data/sources/database/daos/transactions.dao.dart';
import 'package:crypto_benefit/app/domain/repositories/import_file.repository.dart';
import 'package:crypto_benefit/app/domain/repositories/statistic.repository.dart';
import 'package:crypto_benefit/app/domain/repositories/transaction.repository.dart';
import 'package:crypto_benefit/app/domain/repositories/transaction_kind.repository.dart';
import 'package:crypto_benefit/app/domain/usecases/dashboard/compute_stats.usecase.dart';
import 'package:crypto_benefit/app/domain/usecases/import/clear_imports.usecase.dart';
import 'package:crypto_benefit/app/domain/usecases/import/import_file.usecase.dart';
import 'package:crypto_benefit/app/domain/usecases/import/watch_imported_files.usecase.dart';
import 'package:crypto_benefit/app/domain/usecases/settings/create_statistic.usecase.dart';
import 'package:crypto_benefit/app/domain/usecases/settings/delete_statistic.usecase.dart';
import 'package:crypto_benefit/app/domain/usecases/settings/get_transaction_kinds.usecase.dart';
import 'package:crypto_benefit/app/domain/usecases/settings/update_statistic.usecase.dart';
import 'package:crypto_benefit/app/domain/usecases/settings/watch_statistics.usecase.dart';
import 'package:crypto_benefit/app/domain/usecases/stat_detail/compute_statistic_chart.usecase.dart';
import 'package:crypto_benefit/app/presentation/modules/dashboard/dashboard.viewmodel.dart';
import 'package:crypto_benefit/app/presentation/modules/home/home.viewmodel.dart';
import 'package:crypto_benefit/app/presentation/modules/import/import.viewmodel.dart';
import 'package:crypto_benefit/app/presentation/modules/settings/settings.viewmodel.dart';
import 'package:crypto_benefit/app/presentation/modules/stat_detail/stat_detail.viewmodel.dart';
import 'package:get_it/get_it.dart';

/// Static access to the current get it instance
final GetIt inject = GetIt.I;

/// Setup the dependency injection
Future<void> setupInjection() async {
  // Database
  inject.registerLazySingleton(() => new AppDatabase());

  // Daos
  inject.registerLazySingleton<TransactionsDao>(
      () => inject<AppDatabase>().transactionsDao);
  inject.registerLazySingleton<ImportedFilesDao>(
      () => inject<AppDatabase>().importedFilesDao);
  inject.registerLazySingleton<TransactionKindsDao>(
      () => inject<AppDatabase>().transactionKindsDao);
  inject.registerLazySingleton<StatisticsDao>(
      () => inject<AppDatabase>().statisticsDao);

  // Mappers
  inject.registerLazySingleton(() => new ImportedFileMapper());
  inject.registerLazySingleton(() => new TransactionMapper());
  inject.registerLazySingleton(() => new TransactionKindMapper());
  inject.registerLazySingleton(() => new StatisticMapper());

  // Repositories
  inject.registerLazySingleton<ITransactionRepository>(
      () => new TransactionRepository());
  inject.registerLazySingleton<IImportFileRepository>(
      () => new ImportFileRepository());
  inject.registerLazySingleton<ITransactionKindRepository>(
      () => new TransactionKindRepository());
  inject.registerLazySingleton<IStatisticRepository>(
      () => new StatisticRepository());

  // Use Cases
  await setupUseCases();

  // ViewModels
  inject.registerLazySingleton(() => new HomeViewModel());
  inject.registerLazySingleton(() => new ImportViewModel());
  inject.registerLazySingleton(() => new DashboardViewModel());
  inject.registerLazySingleton(() => new SettingsViewModel());
  inject.registerLazySingleton(() => new StatDetailViewModel());
}

Future<void> setupUseCases() async {
  // Import Use Cases
  inject.registerLazySingleton(() => new ImportFileUseCase());
  inject.registerLazySingleton(() => new ClearImportsUseCase());
  inject.registerLazySingleton(() => new WatchImportedFileUseCase());

  // Settings Use Cases
  inject.registerLazySingleton(() => new WatchStatisticsUseCase());
  inject.registerLazySingleton(() => new GetTransactionKindsUseCase());
  inject.registerLazySingleton(() => new CreateStatisticUseCase());
  inject.registerLazySingleton(() => new UpdateStatisticUseCase());
  inject.registerLazySingleton(() => new DeleteStatisticUseCase());

  // Dashboard use case
  inject.registerLazySingleton(() => new WatchComputedStatsUseCase());

  // Statistic detail use case
  inject.registerLazySingleton(() => new ComputeStatisticChartUseCase());
}

import 'package:crypto_benefit/app/data/mappers/imported_file.mapper.dart';
import 'package:crypto_benefit/app/data/mappers/transaction.mapper.dart';
import 'package:crypto_benefit/app/data/mappers/transaction_kind.mapper.dart';
import 'package:crypto_benefit/app/data/repositories/import_file.repository.dart';
import 'package:crypto_benefit/app/data/repositories/transaction.repository.dart';
import 'package:crypto_benefit/app/data/repositories/transaction_kind.repository.dart';
import 'package:crypto_benefit/app/data/sources/database/app_database.dart';
import 'package:crypto_benefit/app/data/sources/database/daos/imported_files.dao.dart';
import 'package:crypto_benefit/app/data/sources/database/daos/transaction_kinds.dao.dart';
import 'package:crypto_benefit/app/data/sources/database/daos/transactions.dao.dart';
import 'package:crypto_benefit/app/domain/repositories/import_file.repository.dart';
import 'package:crypto_benefit/app/domain/repositories/transaction.repository.dart';
import 'package:crypto_benefit/app/domain/repositories/transaction_kind.repository.dart';
import 'package:crypto_benefit/app/domain/usecases/import/clear_imports.usecase.dart';
import 'package:crypto_benefit/app/domain/usecases/import/get_imported_file.usecase.dart';
import 'package:crypto_benefit/app/domain/usecases/import/import_file.usecase.dart';
import 'package:crypto_benefit/app/presentation/modules/dashboard/dashboard.viewmodel.dart';
import 'package:crypto_benefit/app/presentation/modules/home/home.viewmodel.dart';
import 'package:crypto_benefit/app/presentation/modules/import/import.viewmodel.dart';
import 'package:crypto_benefit/app/presentation/modules/transactions/transactions.viewmodel.dart';
import 'package:get_it/get_it.dart';

final GetIt inject = GetIt.I;

Future<void> setupInjection() async {
  // Database
  inject.registerLazySingleton(() => new AppDatabase());

  // Daos
  inject.registerLazySingleton(() => new TransactionsDao());
  inject.registerLazySingleton(() => new ImportedFilesDao());
  inject.registerLazySingleton(() => new TransactionKindsDao());

  // Mappers
  inject.registerLazySingleton<ImportedFileMapper>(
      () => new ImportedFileMapper());
  inject.registerLazySingleton(() => new TransactionMapper());
  inject.registerLazySingleton(() => new TransactionKindMapper());

  // Repositories
  inject.registerLazySingleton<ITransactionRepository>(
      () => new TransactionRepository());
  inject.registerLazySingleton<IImportFileRepository>(
      () => new ImportFileRepository());
  inject.registerLazySingleton<ITransactionKindRepository>(
      () => new TransactionKindRepository());

  // Use Cases
  inject.registerLazySingleton(() => new ImportFileUseCase());
  inject.registerLazySingleton(() => new ClearImportsUseCase());
  inject.registerLazySingleton(() => new GetImportedFileUseCase());

  // ViewModels
  inject.registerLazySingleton(() => new HomeViewModel());
  inject.registerLazySingleton(() => new ImportViewModel());
  inject.registerLazySingleton(() => new TransactionsViewModel());
  inject.registerLazySingleton(() => new DashboardViewModel());
}

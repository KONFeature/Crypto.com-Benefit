import 'package:crypto_benefit/app/domain/usecases/dashboard/compute_file_stats.usecase.dart';
import 'package:crypto_benefit/app/domain/usecases/dashboard/compute_kind_stats.usecase.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';
import 'package:mobx/mobx.dart';

part 'dashboard.viewmodel.g.dart';

class DashboardViewModel = _DashboardViewModelBase with _$DashboardViewModel;

/// The view model for our transactions page.
abstract class _DashboardViewModelBase with Store {
  /// Our use cases
  final _computeKindsStateUseCase = inject<ComputeKindStatsUseCase>();
  final _computeFilesStateUseCase = inject<ComputeFileStatsUseCase>();

  @observable
  ObservableFuture<List<dynamic>> _kindStats;

  @observable
  ObservableFuture<List<dynamic>> _fileStats;

  @computed
  bool get isLoading =>
      _kindStats.status == FutureStatus.pending ||
      _fileStats.status == FutureStatus.pending;

  @computed
  List<dynamic> get kindStats =>
      _kindStats.status == FutureStatus.fulfilled ? _kindStats.value : List();
  @computed
  List<dynamic> get fileStats =>
      _fileStats.status == FutureStatus.fulfilled ? _fileStats.value : List();

  @action
  Future<void> loadStats() async {
    // Compute kind stats
    _kindStats = _computeKindsStateUseCase.execute(null).asObservable();
    _fileStats = _computeFilesStateUseCase.execute(null).asObservable();

    // TODO : Option to merge kind stat
    // TODO : After stat computed save them in the database
  }
}

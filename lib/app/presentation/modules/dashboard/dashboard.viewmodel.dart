import 'package:crypto_benefit/app/domain/usecases/dashboard/compute_kind_stats.usecase.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';
import 'package:mobx/mobx.dart';

part 'dashboard.viewmodel.g.dart';

class DashboardViewModel = _DashboardViewModelBase with _$DashboardViewModel;

/// The view model for our transactions page.
abstract class _DashboardViewModelBase with Store {
  /// Our use cases
  final _computeKindsStateUseCase = inject<ComputeKindStatsUseCase>();

  @observable
  ObservableFuture<List<dynamic>> _kindStats;

  @computed
  bool get isLoading => _kindStats.status == FutureStatus.pending;

  @computed
  List<dynamic> get kindStats =>
      _kindStats.status == FutureStatus.fulfilled ? _kindStats.value : List();

  @action
  Future<void> loadStats() async {
    // Compute kind stats
    _kindStats = _computeKindsStateUseCase.execute(null).asObservable();
    // TODO : Also files stats ?
    // TODO : Option to merge kind stat
    // TODO : After stat computed save them in the database
  }
}

import 'package:crypto_benefit/app/domain/usecases/dashboard/compute_stats.usecase.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';
import 'package:mobx/mobx.dart';

part 'dashboard.viewmodel.g.dart';

class DashboardViewModel = _DashboardViewModelBase with _$DashboardViewModel;

/// The view model for our dashboard page.
abstract class _DashboardViewModelBase with Store {
  /// Our use case the compute the statistics
  final _computeStatsUseCase = inject<WatchComputedStatsUseCase>();

  @observable
  ObservableStream<Iterable> _stats;

  @computed
  bool get isLoading => _stats.status == StreamStatus.waiting;

  @computed
  Iterable<dynamic> get stats => _stats.value;

  _DashboardViewModelBase() {
    // TODO : Observable stream of list to observable list ???
    // Compute statistics
    _stats = _computeStatsUseCase.watch(null).asObservable();
  }
}

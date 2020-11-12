import 'package:crypto_benefit/app/domain/object/statistic/computed_statistic.dart';
import 'package:crypto_benefit/app/domain/usecases/dashboard/compute_stats.usecase.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';
import 'package:mobx/mobx.dart';

part 'dashboard.viewmodel.g.dart';

class DashboardViewModel = _DashboardViewModelBase with _$DashboardViewModel;

/// The view model for our transactions page.
abstract class _DashboardViewModelBase with Store {
  /// Our use cases
  final _computeKindsStateUseCase = inject<WatchComputedStatsUseCase>();

  @observable
  ObservableStream<Iterable> _stats;

  @computed
  bool get isLoading => _stats.status == StreamStatus.waiting;

  @computed
  Iterable<dynamic> get stats => _stats.value;

  _DashboardViewModelBase() {
    // TODO : Observable stream of list to observable list ???
    // Compute kind stats
    _stats = _computeKindsStateUseCase.watch(null).asObservable();
    _stats.listen((event) {
        print("Data received $event");
    });
  }
}

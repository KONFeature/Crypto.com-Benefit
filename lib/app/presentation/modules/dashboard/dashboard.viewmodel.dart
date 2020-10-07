import 'package:crypto_benefit/app/domain/repositories/transaction_kind.repository.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';
import 'package:mobx/mobx.dart';

part 'dashboard.viewmodel.g.dart';

class DashboardViewModel = _DashboardViewModelBase with _$DashboardViewModel;

/// The view model for our transactions page.
abstract class _DashboardViewModelBase with Store {
  /// Our transaction kind repository
  final _transactionKindRepository = inject<ITransactionKindRepository>();

  @observable
  ObservableFuture<List<dynamic>> _transactionStats;

  @computed
  bool get isLoading => _transactionStats.status == FutureStatus.pending;

  @computed
  List<dynamic> get transactionStats =>
      _transactionStats.status == FutureStatus.fulfilled
          ? _transactionStats.value
          : List();

  @action
  Future<void> loadStats() async {
    // Compute our stats
    _transactionStats =
        _transactionKindRepository.computeTransactionKindStats().asObservable();
  }
}

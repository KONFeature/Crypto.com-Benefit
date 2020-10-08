import 'package:crypto_benefit/app/domain/usecases/transactions/get_transactions.usecase.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';
import 'package:mobx/mobx.dart';

part 'transactions.viewmodel.g.dart';

class TransactionsViewModel = _TransactionsViewModelBase
    with _$TransactionsViewModel;

/// The view model for our transactions page.
abstract class _TransactionsViewModelBase with Store {
  /// Our transaction repository
  final _getTransactionsUseCase = inject<GetTransactionsUseCase>();

  @observable
  ObservableStream<List> _transactions;

  @computed
  bool get isLoading => _transactions.status == StreamStatus.waiting;

  @computed
  List<dynamic> get transactions => _transactions.value;

  @action
  Future<void> loadTransactions() async {
    _transactions = _getTransactionsUseCase.get(null).asObservable();
  }
}

import 'package:crypto_benefit/app/domain/object/imported_file.dart';
import 'package:crypto_benefit/app/domain/object/transaction_kind.dart';
import 'package:crypto_benefit/app/domain/usecases/settings/get_transaction_kinds.usecase.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';
import 'package:mobx/mobx.dart';

part 'create_statistic.viewmodel.g.dart';

class CreateStatisticViewModel = _CreateStatisticViewModelBase
    with _$CreateStatisticViewModel;

/// The view model for our create statistic modal.
/// TODO : Disposable view model (To prevent keeping the instance during the app lifecycle)
abstract class _CreateStatisticViewModelBase with Store {
  /// Our transaction repository
  final _getTransactionKindsUseCase = inject<GetTransactionKindsUseCase>();

  @observable
  ObservableFuture<List<TransactionKind>> _kinds;

  @computed
  bool get isLoading => _kinds.status == FutureStatus.pending;

  @computed
  List get kinds => _kinds.value;

  /// Map telling us if a file type is selected or not
  @observable
  ObservableMap<FileType, bool> _typeSelected = ObservableMap();
  @computed
  ObservableMap<FileType, bool> get typeSelected => _typeSelected;

  _CreateStatisticViewModelBase() {
    // Fetch our transaction kinds
    _kinds = _getTransactionKindsUseCase.execute(null).asObservable();
    // Init our types map to false
    FileType.values
        .forEach((type) => _typeSelected.putIfAbsent(type, () => false));
  }

  /// Update the selection status for a given file type
  @action
  updateTypeSelection(FileType type, bool isSelected) {
    _typeSelected.update(type, (value) => isSelected);
  }
}

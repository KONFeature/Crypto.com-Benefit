import 'package:crypto_benefit/app/domain/object/imported_file.dart';
import 'package:crypto_benefit/app/domain/object/statistic/statistic.dart';
import 'package:crypto_benefit/app/domain/object/transaction_kind.dart';
import 'package:crypto_benefit/app/domain/usecases/settings/create_statistic.usecase.dart';
import 'package:crypto_benefit/app/domain/usecases/settings/get_transaction_kinds.usecase.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';
import 'package:mobx/mobx.dart';

part 'create_statistic.viewmodel.g.dart';

class CreateStatisticViewModel = _CreateStatisticViewModelBase
    with _$CreateStatisticViewModel;

/// The view model for our create / update statistic modal.
abstract class _CreateStatisticViewModelBase with Store {
  /// Use case to fetch all the kinds
  final _getTransactionKindsUseCase = inject<GetTransactionKindsUseCase>();

  /// Use case to create a new statistic
  final _createStatisticUseCase = inject<CreateStatisticUseCase>();

  /// Valid char for statistic name
  static final _validCharactersForName = RegExp(r'^[a-zA-Z0-9 ]+$');

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

  /// Map telling us if a kinds is selected or not
  @observable
  ObservableMap<TransactionKind, bool> _kindSelected = ObservableMap();
  @computed
  ObservableMap<TransactionKind, bool> get kindSelected => _kindSelected;

  // Base statistic
  Statistic _statisticToUpdate;

  /// Last validated statistic name

  _CreateStatisticViewModelBase() {
    // Fetch our transaction kinds
    _kinds = _getTransactionKindsUseCase.execute(null).asObservable();
    _kinds.then((kinds) => kinds.forEach((kind) {
          _kindSelected.putIfAbsent(kind, () => false);
        }));
    // Init our types map to false
    FileType.values
        .forEach((type) => _typeSelected.putIfAbsent(type, () => false));
  }

  /// Init for a statistic update
  void initStatisticUpdate(Statistic statistic) {
    // Backup the statistic object
    _statisticToUpdate = statistic;
    // Check the right file types
    statistic.filter.fileTypes.forEach((type) {
      _typeSelected.update(type, (value) => true, ifAbsent: () => true);
    });
    // Check the right kinds types
    statistic.filter.kinds.forEach((kind) {
      _kindSelected.update(kind, (value) => true, ifAbsent: () => true);
    });
  }

  String _statisticName;

  /// Retreive the inital stat name
  String get initialStatName =>
      _statisticToUpdate != null ? _statisticToUpdate.name : '';

  /// Validate a statistic name
  String validateStatName(String currentName) {
    if (currentName.isEmpty) {
      return 'Please enter a statistic name';
    } else if (!_validCharactersForName.hasMatch(currentName)) {
      return 'You can only use letter, number and space for the statistic name';
    }
    _statisticName = currentName;
    return null;
  }

  /// Update the selection status for a given file type
  @action
  updateTypeSelection(FileType type, bool isSelected) {
    _typeSelected.update(type, (value) => isSelected,
        ifAbsent: () => isSelected);
  }

  /// Update the selection status for a given file type
  @action
  updateKindSelection(TransactionKind kind, bool isSelected) {
    _kindSelected.update(kind, (value) => isSelected,
        ifAbsent: () => isSelected);
  }

  /// Launch the statistic creation
  launchStatisticCreateOrUpdate() async {
    // TODO : If we have a current statistic object we update it
    if (_statisticToUpdate != null) return;
    // Extract all the kind selected
    List<TransactionKind> selectedKinds = List();
    for (var kindEntry in _kindSelected.entries) {
      if (kindEntry.value) selectedKinds.add(kindEntry.key);
    }
    // Extract the types selected
    List<FileType> selectedTypes = List();
    for (var typeEntry in _typeSelected.entries) {
      if (typeEntry.value) selectedTypes.add(typeEntry.key);
    }
    // Perform the stat creation
    await _createStatisticUseCase.execute(CreateStatisticParams(
        name: _statisticName, kinds: selectedKinds, types: selectedTypes));
  }

  /// The libelle for the go button
  String get textActionButton =>
      _statisticToUpdate == null ? 'Create' : 'Update';
}

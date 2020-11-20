import 'package:crypto_benefit/app/domain/object/imported_file.dart';
import 'package:crypto_benefit/app/domain/object/statistic/statistic.dart';
import 'package:crypto_benefit/app/domain/object/transaction_kind.dart';
import 'package:crypto_benefit/app/domain/usecases/settings/create_statistic.usecase.dart';
import 'package:crypto_benefit/app/domain/usecases/settings/get_transaction_kinds.usecase.dart';
import 'package:crypto_benefit/app/domain/usecases/settings/update_statistic.usecase.dart';
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

  /// Use case to update statistic
  final _updateStatisticUseCase = inject<UpdateStatisticUseCase>();

  /// Valid char for statistic name
  static final _validCharactersForName = RegExp(r'^[a-zA-Z0-9 ]+$');

  ObservableFuture<Iterable<TransactionKind>> _kinds;

  @computed
  bool get isKindLoading => _kinds.status == FutureStatus.pending;

  /// Map telling us if a file type is selected or not
  @observable
  Map<FileType, bool> _typeSelected = ObservableMap();

  @computed
  Map<FileType, bool> get typeSelected => _typeSelected;

  /// Map telling us if a kinds is selected or not
  @observable
  Map<TransactionKind, bool> _kindSelected = ObservableMap();

  @computed
  Map<TransactionKind, bool> get kindSelected => _kindSelected;

  // Base statistic
  Statistic _statisticToUpdate;

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
    _typeSelected[type] = isSelected;
  }

  /// Update the selection status for a given file type
  @action
  updateKindSelection(TransactionKind kind, bool isSelected) {
    _kindSelected[kind] = isSelected;
  }

  /// The libelle for the go button
  String get textActionButton =>
      _statisticToUpdate == null ? 'Create' : 'Update';

  /// Launch the statistic creation
  launchStatisticCreateOrUpdate() async {
    // Extract all the kind selected
    final List<TransactionKind> selectedKinds = _kindSelected.keys
        .where((kind) => _kindSelected[kind] ?? false)
        .toList(growable: false);
    for (var kindEntry in _kindSelected.entries) {
      if (kindEntry.value) selectedKinds.add(kindEntry.key);
    }
    // Extract the types selected
    final List<FileType> selectedTypes = _typeSelected.keys
        .where((type) => _typeSelected[type] ?? false)
        .toList(growable: false);
    // Then perform the operation
    if (_statisticToUpdate == null) {
      await _launchStatisticCreation(selectedKinds, selectedTypes);
    } else {
      await _launchStatisticUpdate(selectedKinds, selectedTypes);
    }
  }

  /// Launch the statistic creation process
  _launchStatisticCreation(
      List<TransactionKind> selectedKinds, List<FileType> selectedTypes) async {
    // Perform the stat creation
    await _createStatisticUseCase.execute(CreateStatisticParams(
        name: _statisticName, kinds: selectedKinds, types: selectedTypes));
  }

  /// Launch the statistic update process
  _launchStatisticUpdate(
      List<TransactionKind> selectedKinds, List<FileType> selectedTypes) async {
    // Perform the stat creation
    await _updateStatisticUseCase.execute(UpdateStatisticParams(
        id: _statisticToUpdate.id,
        name: _statisticName,
        kinds: selectedKinds,
        types: selectedTypes));
  }
}

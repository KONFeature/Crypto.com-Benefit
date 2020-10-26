// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_statistic.viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateStatisticViewModel on _CreateStatisticViewModelBase, Store {
  Computed<bool> _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_CreateStatisticViewModelBase.isLoading'))
          .value;
  Computed<List<dynamic>> _$kindsComputed;

  @override
  List<dynamic> get kinds =>
      (_$kindsComputed ??= Computed<List<dynamic>>(() => super.kinds,
              name: '_CreateStatisticViewModelBase.kinds'))
          .value;
  Computed<ObservableMap<FileType, bool>> _$typeSelectedComputed;

  @override
  ObservableMap<FileType, bool> get typeSelected => (_$typeSelectedComputed ??=
          Computed<ObservableMap<FileType, bool>>(() => super.typeSelected,
              name: '_CreateStatisticViewModelBase.typeSelected'))
      .value;

  final _$_kindsAtom = Atom(name: '_CreateStatisticViewModelBase._kinds');

  @override
  ObservableFuture<List<TransactionKind>> get _kinds {
    _$_kindsAtom.reportRead();
    return super._kinds;
  }

  @override
  set _kinds(ObservableFuture<List<TransactionKind>> value) {
    _$_kindsAtom.reportWrite(value, super._kinds, () {
      super._kinds = value;
    });
  }

  final _$_typeSelectedAtom =
      Atom(name: '_CreateStatisticViewModelBase._typeSelected');

  @override
  ObservableMap<FileType, bool> get _typeSelected {
    _$_typeSelectedAtom.reportRead();
    return super._typeSelected;
  }

  @override
  set _typeSelected(ObservableMap<FileType, bool> value) {
    _$_typeSelectedAtom.reportWrite(value, super._typeSelected, () {
      super._typeSelected = value;
    });
  }

  final _$_CreateStatisticViewModelBaseActionController =
      ActionController(name: '_CreateStatisticViewModelBase');

  @override
  dynamic updateTypeSelection(FileType type, bool isSelected) {
    final _$actionInfo = _$_CreateStatisticViewModelBaseActionController
        .startAction(name: '_CreateStatisticViewModelBase.updateTypeSelection');
    try {
      return super.updateTypeSelection(type, isSelected);
    } finally {
      _$_CreateStatisticViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
kinds: ${kinds},
typeSelected: ${typeSelected}
    ''';
  }
}

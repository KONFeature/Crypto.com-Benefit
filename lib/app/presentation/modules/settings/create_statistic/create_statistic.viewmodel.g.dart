// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_statistic.viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateStatisticViewModel on _CreateStatisticViewModelBase, Store {
  Computed<bool> _$isKindLoadingComputed;

  @override
  bool get isKindLoading =>
      (_$isKindLoadingComputed ??= Computed<bool>(() => super.isKindLoading,
              name: '_CreateStatisticViewModelBase.isKindLoading'))
          .value;
  Computed<Map<FileType, bool>> _$typeSelectedComputed;

  @override
  Map<FileType, bool> get typeSelected => (_$typeSelectedComputed ??=
          Computed<Map<FileType, bool>>(() => super.typeSelected,
              name: '_CreateStatisticViewModelBase.typeSelected'))
      .value;
  Computed<Map<TransactionKind, bool>> _$kindSelectedComputed;

  @override
  Map<TransactionKind, bool> get kindSelected => (_$kindSelectedComputed ??=
          Computed<Map<TransactionKind, bool>>(() => super.kindSelected,
              name: '_CreateStatisticViewModelBase.kindSelected'))
      .value;

  final _$_typeSelectedAtom =
      Atom(name: '_CreateStatisticViewModelBase._typeSelected');

  @override
  Map<FileType, bool> get _typeSelected {
    _$_typeSelectedAtom.reportRead();
    return super._typeSelected;
  }

  @override
  set _typeSelected(Map<FileType, bool> value) {
    _$_typeSelectedAtom.reportWrite(value, super._typeSelected, () {
      super._typeSelected = value;
    });
  }

  final _$_kindSelectedAtom =
      Atom(name: '_CreateStatisticViewModelBase._kindSelected');

  @override
  Map<TransactionKind, bool> get _kindSelected {
    _$_kindSelectedAtom.reportRead();
    return super._kindSelected;
  }

  @override
  set _kindSelected(Map<TransactionKind, bool> value) {
    _$_kindSelectedAtom.reportWrite(value, super._kindSelected, () {
      super._kindSelected = value;
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
  dynamic updateKindSelection(TransactionKind kind, bool isSelected) {
    final _$actionInfo = _$_CreateStatisticViewModelBaseActionController
        .startAction(name: '_CreateStatisticViewModelBase.updateKindSelection');
    try {
      return super.updateKindSelection(kind, isSelected);
    } finally {
      _$_CreateStatisticViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isKindLoading: ${isKindLoading},
typeSelected: ${typeSelected},
kindSelected: ${kindSelected}
    ''';
  }
}

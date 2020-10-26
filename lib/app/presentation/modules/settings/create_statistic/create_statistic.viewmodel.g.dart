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
  Computed<Map<FileType, bool>> _$typeSelectedComputed;

  @override
  Map<FileType, bool> get typeSelected => (_$typeSelectedComputed ??=
          Computed<Map<FileType, bool>>(() => super.typeSelected,
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

  final _$_typesSelectionStatusAtom =
      Atom(name: '_CreateStatisticViewModelBase._typesSelectionStatus');

  @override
  Map<FileType, bool> get _typesSelectionStatus {
    _$_typesSelectionStatusAtom.reportRead();
    return super._typesSelectionStatus;
  }

  @override
  set _typesSelectionStatus(Map<FileType, bool> value) {
    _$_typesSelectionStatusAtom.reportWrite(value, super._typesSelectionStatus,
        () {
      super._typesSelectionStatus = value;
    });
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

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SettingsViewModel on _SettingsViewModelBase, Store {
  Computed<bool> _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_SettingsViewModelBase.isLoading'))
          .value;
  Computed<List<dynamic>> _$transactionsComputed;

  @override
  List<dynamic> get transactions => (_$transactionsComputed ??=
          Computed<List<dynamic>>(() => super.transactions,
              name: '_SettingsViewModelBase.transactions'))
      .value;

  final _$_statisticsAtom = Atom(name: '_SettingsViewModelBase._statistics');

  @override
  ObservableStream<List<dynamic>> get _statistics {
    _$_statisticsAtom.reportRead();
    return super._statistics;
  }

  @override
  set _statistics(ObservableStream<List<dynamic>> value) {
    _$_statisticsAtom.reportWrite(value, super._statistics, () {
      super._statistics = value;
    });
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
transactions: ${transactions}
    ''';
  }
}

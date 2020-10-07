// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard.viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DashboardViewModel on _DashboardViewModelBase, Store {
  Computed<bool> _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_DashboardViewModelBase.isLoading'))
          .value;
  Computed<List<dynamic>> _$transactionStatsComputed;

  @override
  List<dynamic> get transactionStats => (_$transactionStatsComputed ??=
          Computed<List<dynamic>>(() => super.transactionStats,
              name: '_DashboardViewModelBase.transactionStats'))
      .value;

  final _$_transactionStatsAtom =
      Atom(name: '_DashboardViewModelBase._transactionStats');

  @override
  ObservableFuture<List<dynamic>> get _transactionStats {
    _$_transactionStatsAtom.reportRead();
    return super._transactionStats;
  }

  @override
  set _transactionStats(ObservableFuture<List<dynamic>> value) {
    _$_transactionStatsAtom.reportWrite(value, super._transactionStats, () {
      super._transactionStats = value;
    });
  }

  final _$loadStatsAsyncAction =
      AsyncAction('_DashboardViewModelBase.loadStats');

  @override
  Future<void> loadStats() {
    return _$loadStatsAsyncAction.run(() => super.loadStats());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
transactionStats: ${transactionStats}
    ''';
  }
}

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
  Computed<List<dynamic>> _$kindStatsComputed;

  @override
  List<dynamic> get kindStats =>
      (_$kindStatsComputed ??= Computed<List<dynamic>>(() => super.kindStats,
              name: '_DashboardViewModelBase.kindStats'))
          .value;
  Computed<List<dynamic>> _$fileStatsComputed;

  @override
  List<dynamic> get fileStats =>
      (_$fileStatsComputed ??= Computed<List<dynamic>>(() => super.fileStats,
              name: '_DashboardViewModelBase.fileStats'))
          .value;

  final _$_kindStatsAtom = Atom(name: '_DashboardViewModelBase._kindStats');

  @override
  ObservableFuture<List<dynamic>> get _kindStats {
    _$_kindStatsAtom.reportRead();
    return super._kindStats;
  }

  @override
  set _kindStats(ObservableFuture<List<dynamic>> value) {
    _$_kindStatsAtom.reportWrite(value, super._kindStats, () {
      super._kindStats = value;
    });
  }

  final _$_fileStatsAtom = Atom(name: '_DashboardViewModelBase._fileStats');

  @override
  ObservableFuture<List<dynamic>> get _fileStats {
    _$_fileStatsAtom.reportRead();
    return super._fileStats;
  }

  @override
  set _fileStats(ObservableFuture<List<dynamic>> value) {
    _$_fileStatsAtom.reportWrite(value, super._fileStats, () {
      super._fileStats = value;
    });
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
kindStats: ${kindStats},
fileStats: ${fileStats}
    ''';
  }
}

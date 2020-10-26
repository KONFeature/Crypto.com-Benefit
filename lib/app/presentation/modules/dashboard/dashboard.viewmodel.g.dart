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
  Computed<List<dynamic>> _$statsComputed;

  @override
  List<dynamic> get stats =>
      (_$statsComputed ??= Computed<List<dynamic>>(() => super.stats,
              name: '_DashboardViewModelBase.stats'))
          .value;

  final _$_statsAtom = Atom(name: '_DashboardViewModelBase._stats');

  @override
  ObservableStream<List<dynamic>> get _stats {
    _$_statsAtom.reportRead();
    return super._stats;
  }

  @override
  set _stats(ObservableStream<List<dynamic>> value) {
    _$_statsAtom.reportWrite(value, super._stats, () {
      super._stats = value;
    });
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
stats: ${stats}
    ''';
  }
}

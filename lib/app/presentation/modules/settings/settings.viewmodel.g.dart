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
  Computed<List<dynamic>> _$statisticsComputed;

  @override
  List<dynamic> get statistics =>
      (_$statisticsComputed ??= Computed<List<dynamic>>(() => super.statistics,
              name: '_SettingsViewModelBase.statistics'))
          .value;

  final _$statisticsStreamAtom =
      Atom(name: '_SettingsViewModelBase.statisticsStream');

  @override
  ObservableStream<List<dynamic>> get statisticsStream {
    _$statisticsStreamAtom.reportRead();
    return super.statisticsStream;
  }

  @override
  set statisticsStream(ObservableStream<List<dynamic>> value) {
    _$statisticsStreamAtom.reportWrite(value, super.statisticsStream, () {
      super.statisticsStream = value;
    });
  }

  @override
  String toString() {
    return '''
statisticsStream: ${statisticsStream},
isLoading: ${isLoading},
statistics: ${statistics}
    ''';
  }
}

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
  Computed<List<Statistic>> _$statisticsComputed;

  @override
  List<Statistic> get statistics => (_$statisticsComputed ??=
          Computed<List<Statistic>>(() => super.statistics,
              name: '_SettingsViewModelBase.statistics'))
      .value;

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
statistics: ${statistics}
    ''';
  }
}

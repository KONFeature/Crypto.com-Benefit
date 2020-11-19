// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stat_detail.viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StatDetailViewModel on _StatDetailViewModelBase, Store {
  Computed<bool> _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_StatDetailViewModelBase.isLoading'))
          .value;
  Computed<Iterable<StatisticChartSpot>> _$statSpotsComputed;

  @override
  Iterable<StatisticChartSpot> get statSpots => (_$statSpotsComputed ??=
          Computed<Iterable<StatisticChartSpot>>(() => super.statSpots,
              name: '_StatDetailViewModelBase.statSpots'))
      .value;
  Computed<double> _$amountIntervalComputed;

  @override
  double get amountInterval =>
      (_$amountIntervalComputed ??= Computed<double>(() => super.amountInterval,
              name: '_StatDetailViewModelBase.amountInterval'))
          .value;
  Computed<double> _$dateIntervalComputed;

  @override
  double get dateInterval =>
      (_$dateIntervalComputed ??= Computed<double>(() => super.dateInterval,
              name: '_StatDetailViewModelBase.dateInterval'))
          .value;

  final _$_statChartAtom = Atom(name: '_StatDetailViewModelBase._statChart');

  @override
  ObservableStream<StatisticChart> get _statChart {
    _$_statChartAtom.reportRead();
    return super._statChart;
  }

  @override
  set _statChart(ObservableStream<StatisticChart> value) {
    _$_statChartAtom.reportWrite(value, super._statChart, () {
      super._statChart = value;
    });
  }

  final _$computeChartAsyncAction =
      AsyncAction('_StatDetailViewModelBase.computeChart');

  @override
  Future computeChart(ComputedStatistic computedStatistic) {
    return _$computeChartAsyncAction
        .run(() => super.computeChart(computedStatistic));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
statSpots: ${statSpots},
amountInterval: ${amountInterval},
dateInterval: ${dateInterval}
    ''';
  }
}

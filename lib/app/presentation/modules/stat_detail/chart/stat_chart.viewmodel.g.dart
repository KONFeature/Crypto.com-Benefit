// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stat_chart.viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StatChartViewModel on _StatChartViewModelBase, Store {
  Computed<ObservableStream<StatisticChart>> _$_chartStreamComputed;

  @override
  ObservableStream<StatisticChart> get _chartStream =>
      (_$_chartStreamComputed ??= Computed<ObservableStream<StatisticChart>>(
              () => super._chartStream,
              name: '_StatChartViewModelBase._chartStream'))
          .value;
  Computed<bool> _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_StatChartViewModelBase.isLoading'))
          .value;
  Computed<bool> _$isChartLoadingComputed;

  @override
  bool get isChartLoading =>
      (_$isChartLoadingComputed ??= Computed<bool>(() => super.isChartLoading,
              name: '_StatChartViewModelBase.isChartLoading'))
          .value;
  Computed<Iterable<StatisticChartSpot>> _$_statSpotsComputed;

  @override
  Iterable<StatisticChartSpot> get _statSpots => (_$_statSpotsComputed ??=
          Computed<Iterable<StatisticChartSpot>>(() => super._statSpots,
              name: '_StatChartViewModelBase._statSpots'))
      .value;
  Computed<double> _$minTimestampComputed;

  @override
  double get minTimestamp =>
      (_$minTimestampComputed ??= Computed<double>(() => super.minTimestamp,
              name: '_StatChartViewModelBase.minTimestamp'))
          .value;
  Computed<double> _$maxTimestampComputed;

  @override
  double get maxTimestamp =>
      (_$maxTimestampComputed ??= Computed<double>(() => super.maxTimestamp,
              name: '_StatChartViewModelBase.maxTimestamp'))
          .value;
  Computed<Map<StatisticChartAmountType, List<FlSpot>>>
      _$statSpotsByTypeComputed;

  @override
  Map<StatisticChartAmountType, List<FlSpot>> get statSpotsByType =>
      (_$statSpotsByTypeComputed ??=
              Computed<Map<StatisticChartAmountType, List<FlSpot>>>(
                  () => super.statSpotsByType,
                  name: '_StatChartViewModelBase.statSpotsByType'))
          .value;
  Computed<double> _$amountIntervalComputed;

  @override
  double get amountInterval =>
      (_$amountIntervalComputed ??= Computed<double>(() => super.amountInterval,
              name: '_StatChartViewModelBase.amountInterval'))
          .value;
  Computed<double> _$dateAxisIntervalComputed;

  @override
  double get dateAxisInterval => (_$dateAxisIntervalComputed ??=
          Computed<double>(() => super.dateAxisInterval,
              name: '_StatChartViewModelBase.dateAxisInterval'))
      .value;

  final _$_computeChartResultAtom =
      Atom(name: '_StatChartViewModelBase._computeChartResult');

  @override
  ObservableFuture<ComputeStatisticChartResult> get _computeChartResult {
    _$_computeChartResultAtom.reportRead();
    return super._computeChartResult;
  }

  @override
  set _computeChartResult(ObservableFuture<ComputeStatisticChartResult> value) {
    _$_computeChartResultAtom.reportWrite(value, super._computeChartResult, () {
      super._computeChartResult = value;
    });
  }

  final _$computeChartAsyncAction =
      AsyncAction('_StatChartViewModelBase.computeChart');

  @override
  Future computeChart(ComputedStatistic computedStatistic) {
    return _$computeChartAsyncAction
        .run(() => super.computeChart(computedStatistic));
  }

  final _$_StatChartViewModelBaseActionController =
      ActionController(name: '_StatChartViewModelBase');

  @override
  dynamic onFilterUpdated(StatisticChartFilter chartFilter) {
    final _$actionInfo = _$_StatChartViewModelBaseActionController.startAction(
        name: '_StatChartViewModelBase.onFilterUpdated');
    try {
      return super.onFilterUpdated(chartFilter);
    } finally {
      _$_StatChartViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isChartLoading: ${isChartLoading},
minTimestamp: ${minTimestamp},
maxTimestamp: ${maxTimestamp},
statSpotsByType: ${statSpotsByType},
amountInterval: ${amountInterval},
dateAxisInterval: ${dateAxisInterval}
    ''';
  }
}

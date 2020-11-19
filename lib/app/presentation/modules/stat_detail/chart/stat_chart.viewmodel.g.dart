// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stat_chart.viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StatChartViewModel on _StatChartViewModelBase, Store {
  Computed<Map<AmountType, bool>> _$amountSelectedComputed;

  @override
  Map<AmountType, bool> get amountSelected => (_$amountSelectedComputed ??=
          Computed<Map<AmountType, bool>>(() => super.amountSelected,
              name: '_StatChartViewModelBase.amountSelected'))
      .value;
  Computed<bool> _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_StatChartViewModelBase.isLoading'))
          .value;
  Computed<Iterable<StatisticChartSpot>> _$statSpotsComputed;

  @override
  Iterable<StatisticChartSpot> get statSpots => (_$statSpotsComputed ??=
          Computed<Iterable<StatisticChartSpot>>(() => super.statSpots,
              name: '_StatChartViewModelBase.statSpots'))
      .value;
  Computed<Map<AmountType, List<FlSpot>>> _$statSpotsByTypeComputed;

  @override
  Map<AmountType, List<FlSpot>> get statSpotsByType =>
      (_$statSpotsByTypeComputed ??= Computed<Map<AmountType, List<FlSpot>>>(
              () => super.statSpotsByType,
              name: '_StatChartViewModelBase.statSpotsByType'))
          .value;
  Computed<double> _$amountIntervalComputed;

  @override
  double get amountInterval =>
      (_$amountIntervalComputed ??= Computed<double>(() => super.amountInterval,
              name: '_StatChartViewModelBase.amountInterval'))
          .value;
  Computed<double> _$dateIntervalComputed;

  @override
  double get dateInterval =>
      (_$dateIntervalComputed ??= Computed<double>(() => super.dateInterval,
              name: '_StatChartViewModelBase.dateInterval'))
          .value;

  final _$_amountSelectedAtom =
      Atom(name: '_StatChartViewModelBase._amountSelected');

  @override
  Map<AmountType, bool> get _amountSelected {
    _$_amountSelectedAtom.reportRead();
    return super._amountSelected;
  }

  @override
  set _amountSelected(Map<AmountType, bool> value) {
    _$_amountSelectedAtom.reportWrite(value, super._amountSelected, () {
      super._amountSelected = value;
    });
  }

  final _$_StatChartViewModelBaseActionController =
      ActionController(name: '_StatChartViewModelBase');

  @override
  dynamic computeChart(ComputedStatistic computedStatistic) {
    final _$actionInfo = _$_StatChartViewModelBaseActionController.startAction(
        name: '_StatChartViewModelBase.computeChart');
    try {
      return super.computeChart(computedStatistic);
    } finally {
      _$_StatChartViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic selectAmountType(AmountType type, bool isSelected) {
    final _$actionInfo = _$_StatChartViewModelBaseActionController.startAction(
        name: '_StatChartViewModelBase.selectAmountType');
    try {
      return super.selectAmountType(type, isSelected);
    } finally {
      _$_StatChartViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
amountSelected: ${amountSelected},
isLoading: ${isLoading},
statSpots: ${statSpots},
statSpotsByType: ${statSpotsByType},
amountInterval: ${amountInterval},
dateInterval: ${dateInterval}
    ''';
  }
}

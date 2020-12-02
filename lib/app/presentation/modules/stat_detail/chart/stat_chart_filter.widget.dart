import 'package:crypto_benefit/app/domain/object/statistic_chart/statistic_chart_filter.dart';
import 'package:crypto_benefit/core/values/dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Filter widget for our statistic chart
class StatChartFilterWidget extends StatefulWidget {
  /// The callback triggered when the filter is updated
  final StatChartFilterCallback onFilterUpdated;

  // The min and max timestamp for the period
  final double minTimestamp;
  final double maxTimestamp;

  StatChartFilterWidget({
    Key key,
    @required this.onFilterUpdated,
    @required this.minTimestamp,
    @required this.maxTimestamp,
  }) : super(key: key);

  @override
  _StatChartFilterState createState() =>
      _StatChartFilterState(onFilterUpdated, minTimestamp, maxTimestamp);
}

class _StatChartFilterState extends State<StatChartFilterWidget> {
  /// Callback when the filter is updated
  final StatChartFilterCallback onFilterUpdated;

  // Min and max timestamp
  final double _minTimestamp;
  final double _maxTimestamp;

  /// Contain the current filter, init with min and max timestamp and empty list
  var _currentFilter;

  _StatChartFilterState(
      this.onFilterUpdated, this._minTimestamp, this._maxTimestamp) {
    print("Creating the state with value $_minTimestamp and $_maxTimestamp");
    _currentFilter = StatisticChartFilter(
        startPeriod: _minTimestamp, endPeriod: _maxTimestamp, amounts: List());
  }

  /// Get the ranges value from the current filter
  RangeValues get _currentPeriodRange =>
      RangeValues(_currentFilter.startPeriod, _currentFilter.endPeriod);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          _amountTypeSelectors(context),
          _periodSelector(context),
        ],
      );

  /// Widget used to let the user pick the type of amount he want in the graph
  Widget _amountTypeSelectors(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      children: StatisticChartAmountType.values
          .map(
            (amountType) => Padding(
              child: FilterChip(
                label: Text(amountType.name),
                selectedColor: Theme.of(context).accentColor,
                showCheckmark: false,
                selected: _currentFilter.amounts.contains(amountType),
                onSelected: (isSelected) => setState(() {
                  // Add or remove the amount from our selected amount type
                  if (_currentFilter.amounts.contains(amountType)) {
                    _currentFilter.amounts.remove(amountType);
                  } else {
                    _currentFilter.amounts.add(amountType);
                  }
                  // Trigger the callback
                  onFilterUpdated(_currentFilter);
                }),
              ),
              padding: EdgeInsets.symmetric(horizontal: padding),
            ),
          )
          .toList(),
    );
  }

  /// Widget that let the user pick the range displayed in the graph
  Widget _periodSelector(BuildContext context) => RangeSlider(
        min: _minTimestamp,
        max: _maxTimestamp,
        divisions: 100,
        values: _currentPeriodRange,
        onChanged: (rangeValues) => setState(() {
          // Update the stat and end of our filter
          _currentFilter.startPeriod = rangeValues.start;
          _currentFilter.endPeriod = rangeValues.end;
          // Trigger the callback
          onFilterUpdated(_currentFilter);
        }),
        labels: RangeLabels(
          formatDateForTransaction(_currentPeriodRange.start),
          formatDateForTransaction(_currentPeriodRange.end),
        ),
      );

  String formatDateForTransaction(double timestamp) {
    print("Parsing timestamp $timestamp");
    final DateTime date =
        DateTime.fromMillisecondsSinceEpoch(timestamp.toInt());
    return DateFormat.yMd().format(date);
  }
}

typedef StatChartFilterCallback = void Function(StatisticChartFilter filter);

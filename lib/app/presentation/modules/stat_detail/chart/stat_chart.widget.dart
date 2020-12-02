import 'package:crypto_benefit/app/domain/object/statistic/computed_statistic.dart';
import 'package:crypto_benefit/app/presentation/modules/stat_detail/chart/stat_chart_filter.widget.dart';
import 'package:crypto_benefit/core/values/animations.dart';
import 'package:crypto_benefit/core/values/dimens.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';

import 'stat_chart.viewmodel.dart';

/// Widget displaying the chart for a statistic
class StatChardWidget extends StatelessWidget {
  /// The view model (don't use DI because we want a new view model for each view)
  final vm = StatChartViewModel();

  /// The statistic we will display a chart for
  final ComputedStatistic statistic;

  StatChardWidget({Key key, this.statistic}) : super(key: key) {
    print("Rebuilding global widget");
    vm.computeChart(statistic);
  }

  @override
  Widget build(BuildContext context) => Observer(
        builder: (observerContext) => vm.isLoading
            ? _loadingChart(observerContext)
            : Wrap(
                spacing: double.infinity,
                alignment: WrapAlignment.center,
                children: [
                  // The cart itself
                  _chart(observerContext),
                  _graphConfiguration(observerContext)
                ],
              ),
      );

  /// Widget used to display a loading chart
  Widget _loadingChart(BuildContext context) =>
      Text('The chart is currently computing');

  /// Widget display the chart itself
  Widget _chart(BuildContext context) {
    print("Printing chart");
    final typesToDisplay = vm.statSpotsByType.keys;
    return AspectRatio(
      aspectRatio: 2.5,
      child: Container(
        child: LineChart(
          LineChartData(
            lineBarsData: typesToDisplay
                .where((type) =>
                    vm.statSpotsByType[type] != null &&
                    vm.statSpotsByType[type].isNotEmpty)
                .map(
                  (type) => LineChartBarData(
                    spots: vm.statSpotsByType[type],
                    colors: [Theme.of(context).accentColor],
                    barWidth: 2,
                    isStrokeCapRound: true,
                    isCurved: false,
                    dotData: FlDotData(show: false),
                  ),
                )
                .toList(),
            lineTouchData: LineTouchData(
              touchTooltipData: LineTouchTooltipData(
                tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
                tooltipRoundedRadius: cardBorderRadius,
                getTooltipItems: (touchedSpots) {
                  if (touchedSpots == null) {
                    return null;
                  }

                  return touchedSpots.map((LineBarSpot touchedSpot) {
                    if (touchedSpot == null) {
                      return null;
                    }
                    final TextStyle textStyle = TextStyle(
                      color: touchedSpot.bar.colors[0],
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    );
                    return LineTooltipItem(
                        NumberFormat.compactCurrency(symbol: '\$')
                            .format(touchedSpot.y),
                        textStyle);
                  }).toList();
                },
              ),
              handleBuiltInTouches: true,
            ),
            titlesData: FlTitlesData(
              bottomTitles: _bottomChartTitle(),
              leftTitles: _leftChartTitle(),
            ),
            borderData: FlBorderData(
              show: true,
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context).colorScheme.background,
                  width: 4,
                ),
                left: BorderSide(
                  color: Theme.of(context).colorScheme.background,
                  width: 4,
                ),
                right: BorderSide(color: Colors.transparent),
                top: BorderSide(color: Colors.transparent),
              ),
            ),
          ),
          swapAnimationDuration: baseAnimationDuration,
        ),
      ),
    );
  }

  /// Define the bottom titles of our chart
  SideTitles _bottomChartTitle() => SideTitles(
        showTitles: true,
        reservedSize: 32,
        margin: 16,
        interval: vm.dateAxisInterval,
        getTextStyles: (value) => TextStyle(
          color: Color(0xff72719b),
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        getTitles: (timestamp) => formatDateForTransaction(timestamp),
      );

  /// Define the left title of our chart
  SideTitles _leftChartTitle() => SideTitles(
        showTitles: true,
        reservedSize: 48,
        margin: 12,
        interval: vm.amountInterval,
        getTextStyles: (value) => const TextStyle(
          color: Color(0xff75729e),
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        getTitles: (value) =>
            NumberFormat.compactCurrency(symbol: '\$').format(value),
      );

  /// Widget we will use to select the data that we will display in the graph
  Widget _graphConfiguration(BuildContext context) => StatChartFilterWidget(
        onFilterUpdated: (filter) => vm.onFilterUpdated(filter),
        minTimestamp: vm.minTimestamp,
        maxTimestamp: vm.maxTimestamp,
      );

  String formatDateForTransaction(double timestamp) {
    final DateTime date =
        DateTime.fromMillisecondsSinceEpoch(timestamp.toInt());
    return DateFormat.yMd().format(date);
  }
}

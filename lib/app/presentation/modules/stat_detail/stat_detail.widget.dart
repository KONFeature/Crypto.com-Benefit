import 'package:crypto_benefit/app/domain/object/statistic/computed_statistic.dart';
import 'package:crypto_benefit/app/domain/object/statistic_chart/statistic_chart_spot.dart';
import 'package:crypto_benefit/app/presentation/modules/home/home.viewmodel.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';
import 'package:crypto_benefit/core/values/dimens.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'stat_detail.viewmodel.dart';

/// The widget for the statistic detail page
abstract class StatDetailWidget {
  /// Find the current view model
  StatDetailViewModel getVm();

  /// The view model for the home page (needed to change route on stat card click)
  final homeVm = inject<HomeViewModel>();

  /// The title of our page
  Widget header(BuildContext context, ComputedStatistic computedStat) => Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: padding),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => homeVm.onBackPressed(),
                ),
                _headerTitle(context, computedStat.name)
              ],
            ),
          ),
          Divider(
            thickness: 1.0,
          ),
        ],
      );

  /// The title of our page
  Widget _headerTitle(BuildContext context, String text) => Padding(
      padding: EdgeInsets.all(margin),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline5,
        textAlign: TextAlign.center,
      ));

  /// Widget used to display a loading chart
  Widget loadingChart(BuildContext context) =>
      Text('The cart is currently computing');

  var cutOffYValue = 5.0;
  var dateTextStyle = TextStyle(
      fontSize: 10, color: Colors.purple, fontWeight: FontWeight.bold);

  Widget testChart(
          BuildContext context, Iterable<StatisticChartSpot> chartSpots) =>
      LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: chartSpots
                  .map((spot) => FlSpot(spot.timestamp, spot.amount))
                  .toList(),
              colors: [Theme.of(context).accentColor],
              barWidth: 2,
              isStrokeCapRound: true,
              isCurved: true,
              dotData: FlDotData(show: false),
            )
          ],
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
            ),
            touchCallback: (LineTouchResponse touchResponse) {},
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
      );

  /// Define the bottom titles of our chart
  SideTitles _bottomChartTitle() => SideTitles(
        showTitles: true,
        reservedSize: 22,
        margin: 8,
        interval: getVm().dateInterval,
        getTextStyles: (value) => TextStyle(
          color: Color(0xff72719b),
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        getTitles: (value) {
          final DateTime date =
              DateTime.fromMillisecondsSinceEpoch(value.toInt());
          return DateFormat.MMM().format(date);
        },
      );

  /// Define the left title of our chart
  SideTitles _leftChartTitle() => SideTitles(
        showTitles: true,
        reservedSize: 48,
        margin: 12,
        interval: getVm().amountInterval,
        getTextStyles: (value) => const TextStyle(
          color: Color(0xff75729e),
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        getTitles: (value) =>
            NumberFormat.compactCurrency(symbol: '\$').format(value),
      );
}

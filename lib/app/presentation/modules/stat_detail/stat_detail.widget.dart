import 'package:crypto_benefit/app/domain/object/statistic/computed_statistic.dart';
import 'package:crypto_benefit/app/presentation/modules/home/home.viewmodel.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';
import 'package:crypto_benefit/core/values/dimens.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'stat_detail.viewmodel.dart';

/// The widget for the statistic detail page
class StatDetailWidget {
  /// The view model for this page
  final vm = inject<StatDetailViewModel>();

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

  var cutOffYValue = 5.0;
  var dateTextStyle = TextStyle(
      fontSize: 10, color: Colors.purple, fontWeight: FontWeight.bold);

  Widget testChart(BuildContext context) => LineChart(LineChartData(
        lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(
            tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
          ),
          touchCallback: (LineTouchResponse touchResponse) {},
          handleBuiltInTouches: true,
        ),
        gridData: FlGridData(
          show: false,
        ),
        titlesData: FlTitlesData(
          bottomTitles: SideTitles(
            showTitles: true,
            reservedSize: 22,
            getTextStyles: (value) => const TextStyle(
              color: Color(0xff72719b),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            margin: 10,
            getTitles: (value) {
              switch (value.toInt()) {
                case 2:
                  return 'SEPT';
                case 7:
                  return 'OCT';
                case 12:
                  return 'DEC';
              }
              return '';
            },
          ),
          leftTitles: SideTitles(
            showTitles: true,
            getTextStyles: (value) => const TextStyle(
              color: Color(0xff75729e),
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            getTitles: (value) {
              switch (value.toInt()) {
                case 1:
                  return '1m';
                case 2:
                  return '2m';
                case 3:
                  return '3m';
                case 4:
                  return '5m';
              }
              return '';
            },
            margin: 8,
            reservedSize: 30,
          ),
        ),
        borderData: FlBorderData(
          show: true,
          border: const Border(
            bottom: BorderSide(
              color: Color(0xff4e4965),
              width: 4,
            ),
            left: BorderSide(
              color: Colors.transparent,
            ),
            right: BorderSide(
              color: Colors.transparent,
            ),
            top: BorderSide(
              color: Colors.transparent,
            ),
          ),
        ),
        minX: 0,
        maxX: 14,
        maxY: 4,
        minY: 0,
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(1, 1),
              FlSpot(3, 1.5),
              FlSpot(5, 1.4),
              FlSpot(7, 3.4),
              FlSpot(10, 2),
              FlSpot(12, 2.2),
              FlSpot(13, 1.8),
            ],
            isCurved: true,
            colors: [
              const Color(0xff4af699),
            ],
            barWidth: 8,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: false,
            ),
            belowBarData: BarAreaData(
              show: false,
            ),
          )
        ],
      ));
}

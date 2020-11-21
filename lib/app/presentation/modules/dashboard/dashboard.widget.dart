import 'package:crypto_benefit/app/domain/object/statistic/computed_statistic.dart';
import 'package:crypto_benefit/app/presentation/modules/dashboard/dashboard.viewmodel.dart';
import 'package:crypto_benefit/app/presentation/modules/home/home.viewmodel.dart';
import 'package:crypto_benefit/app/presentation/widget/computed_stat_card/computed_stat_card.widget.dart';
import 'package:crypto_benefit/app/presentation/widget/loading_stat_card.widget.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';
import 'package:crypto_benefit/core/values/dimens.dart';
import 'package:flutter/material.dart';

/// The widget for our dashboard page
class DashboardWidget {
  /// The view model for this page
  final vm = inject<DashboardViewModel>();

  /// The view model for the home page (needed to change route on stat card click)
  final homeVm = inject<HomeViewModel>();

  /// The title of our page
  Widget title(BuildContext context) => Padding(
        padding: EdgeInsets.all(margin),
        child: Text(
          'Dashboard',
          style: Theme.of(context).textTheme.headline5,
          textAlign: TextAlign.center,
        ),
      );

  /// Grid that will contain all of our widget
  Widget _statisticsContainer(BuildContext context, List<Widget> children) =>
      OrientationBuilder(
        builder: (context, orientation) => GridView.count(
          crossAxisCount:
              MediaQuery.of(context).orientation == Orientation.portrait
                  ? 2
                  : 3,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          padding: EdgeInsets.all(padding),
          physics: BouncingScrollPhysics(),
          children: children,
        ),
      );

  /// Widget containing the stats imported for transaction kind
  Widget statisticsWidget(
          BuildContext context, List<ComputedStatistic> stats) =>
      _statisticsContainer(
          context,
          stats
              .map(
                (stat) => Container(
                  child: ComputedStatCardWidget(
                    onTap: () {
                      homeVm.goToStatDetail(stat);
                    },
                    computedStat: stat,
                  ),
                ),
              )
              .toList());

  /// Widget to display when no transaction are present
  Widget noStatistics(BuildContext context) => Text(
        'No statistics founded, you can create new one in the settings page.',
        style: Theme.of(context).textTheme.bodyText2,
        textAlign: TextAlign.center,
      );

  /// The loading widget to display
  Widget loading(BuildContext context) =>
      _statisticsContainer(context, [LoadingStatCardWidget()]);
}

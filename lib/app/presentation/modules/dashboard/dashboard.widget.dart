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
      ));

  /// List of kind stats
  Widget statistics(BuildContext context, Iterable<ComputedStatistic> stats) =>
      stats != null && stats.length > 0
          ? _statisticsWidget(context, stats.toList())
          : _noStats(context);

  /// Widget containing the stats imported for transaction kind
  Widget _statisticsWidget(
          BuildContext context, List<ComputedStatistic> stats) =>
      GridView.builder(
        itemCount: stats.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: EdgeInsets.all(padding),
        physics: BouncingScrollPhysics(),
        itemBuilder: (_, index) => Container(
            child: ComputedStatCardWidget(
              onTap: () {
                homeVm.goToStatDetail(stats[index]);
              },
          computedStat: stats[index],
        )),
      );

  /// Widget to display when no transaction are present
  Widget _noStats(BuildContext context) => Text(
        'No statistics founded, you can create new one in the settings page.',
        style: Theme.of(context).textTheme.bodyText2,
        textAlign: TextAlign.center,
      );

  /// The loading widget to display
  Widget loading(BuildContext context) => GridView.builder(
      itemCount: 2,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      padding: EdgeInsets.all(padding),
      physics: BouncingScrollPhysics(),
      itemBuilder: (_, index) => Container(child: LoadingStatCardWidget()));
}

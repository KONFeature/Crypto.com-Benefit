import 'package:crypto_benefit/app/domain/object/statistic/computed_statistic.dart';
import 'package:crypto_benefit/app/presentation/widget/loading_stat_card.widget.dart';
import 'package:crypto_benefit/app/presentation/widget/computed_statistic_card.widget.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';
import 'package:crypto_benefit/app/presentation/modules/dashboard/dashboard.viewmodel.dart';
import 'package:crypto_benefit/core/values/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

/// The widget of the list of transactions pages
class DashboardWidget {
  final vm = inject<DashboardViewModel>();

  /// The title of our page
  Widget title(BuildContext context) => Padding(
      padding: EdgeInsets.all(margin),
      child: Text(
        'Dashboard',
        style: Theme.of(context).textTheme.headline5,
        textAlign: TextAlign.center,
      ));

  /// List of kind stats
  Widget statistics(BuildContext context, List<ComputedStatistic> stats) =>
      stats != null && stats.length > 0
          ? _statisticsWidget(context, stats)
          : _noStats(context);

  /// Widget containing the stats imported for transaction kind
  Widget _statisticsWidget(
          BuildContext context, List<ComputedStatistic> stats) =>
      StaggeredGridView.countBuilder(
        itemCount: stats.length,
        crossAxisCount: 2,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: EdgeInsets.all(padding),
        physics: BouncingScrollPhysics(),
        itemBuilder: (_, index) => Container(
            child: ComputedStatisticCardWidget(
          computedStat: stats[index],
        )),
        staggeredTileBuilder: (_) => StaggeredTile.fit(1),
      );

  /// Widget to display when no transaction are present
  Widget _noStats(BuildContext context) => Text(
        'No statistics founded, go to the import page and import your Crypto.com CSV export.',
        style: Theme.of(context).textTheme.bodyText2,
        textAlign: TextAlign.center,
      );

  Widget loading(BuildContext context) => StaggeredGridView.countBuilder(
        itemCount: 5,
        crossAxisCount: 2,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (_, index) => Container(child: LoadingStatCardWidget()),
        staggeredTileBuilder: (_) => StaggeredTile.fit(1),
      );
}

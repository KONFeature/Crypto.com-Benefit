import 'package:crypto_benefit/app/domain/object/transaction_kind_stat.dart';
import 'package:crypto_benefit/app/presentation/widget/transactions_kind_stat_card.widget.dart';
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

  /// List of transactions
  Widget stats(BuildContext context, List<TransactionStatistic> stats) =>
      stats != null && stats.length > 0
          ? transactionStats(context, stats)
          : _noStats(context);

  /// Widget containing the list of stats imported
  Widget transactionStats(
          BuildContext context, List<TransactionStatistic> stats) =>
      StaggeredGridView.countBuilder(
        itemCount: stats.length,
        crossAxisCount: 2,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (_, index) => Container(
            child: StatCardWidget(
          transactionKindStats: stats[index],
        )),
        staggeredTileBuilder: (_) => StaggeredTile.fit(1),
      );

  /// Widget to display when no transaction are present
  Widget _noStats(BuildContext context) => Text(
        'No stats founded, go to the import page and import your Crypto.com CSV export.',
        style: Theme.of(context).textTheme.bodyText2,
        textAlign: TextAlign.center,
      );

  Widget loading(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(margin),
            child: Text(
              'Computing transactions statistics',
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(margin),
            child: CircularProgressIndicator(),
          )
        ],
      );
}

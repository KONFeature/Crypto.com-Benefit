import 'package:crypto_benefit/app/domain/object/statistic/file_statistic.dart';
import 'package:crypto_benefit/app/domain/object/statistic/kind_statistic.dart';
import 'package:crypto_benefit/app/presentation/widget/transactions_file_stat_card.widget.dart';
import 'package:crypto_benefit/app/presentation/widget/loading_stat_card.widget.dart';
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

  /// The title of our page
  Widget partTitle(BuildContext context, String text) => Padding(
      padding: EdgeInsets.all(margin),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline5,
        textAlign: TextAlign.center,
      ));

  /// List of kind stats
  Widget kindStats(BuildContext context, List<KindStatistic> kindStats) =>
      kindStats != null && kindStats.length > 0
          ? _transactionKindStats(context, kindStats)
          : _noStats(context);

  /// List of kind stats
  Widget fileStats(BuildContext context, List<FileStatistic> fileStats) =>
      fileStats != null && fileStats.length > 0
          ? _transactionFileStats(context, fileStats)
          : _noStats(context);

  /// Widget containing the stats imported for transaction kind
  Widget _transactionKindStats(
          BuildContext context, List<KindStatistic> kindStats) =>
      StaggeredGridView.countBuilder(
        itemCount: kindStats.length,
        crossAxisCount: 2,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (_, index) => Container(
            child: KindStatCardWidget(
          transactionKindStats: kindStats[index],
        )),
        staggeredTileBuilder: (_) => StaggeredTile.fit(1),
      );

  /// Widget containing the stats for imported file
  Widget _transactionFileStats(
          BuildContext context, List<FileStatistic> fileStats) =>
      StaggeredGridView.countBuilder(
        itemCount: fileStats.length,
        crossAxisCount: 2,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (_, index) => Container(
            child: FileStatCardWidget(
          transactionFileStats: fileStats[index],
        )),
        staggeredTileBuilder: (_) => StaggeredTile.fit(1),
      );

  /// Widget to display when no transaction are present
  Widget _noStats(BuildContext context) => Text(
        'No stats founded, go to the import page and import your Crypto.com CSV export.',
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

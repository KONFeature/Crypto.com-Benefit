import 'package:crypto_benefit/app/domain/object/statistic/statistic.dart';
import 'package:crypto_benefit/app/presentation/modules/settings/create_statistic/create_statistic.modal.dart';
import 'package:crypto_benefit/app/presentation/modules/settings/settings.viewmodel.dart';
import 'package:crypto_benefit/app/presentation/widget/statistic_card.widget.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';
import 'package:crypto_benefit/core/values/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

/// The widget of the list of transactions pages
class SettingsWidget {
  final vm = inject<SettingsViewModel>();

  /// The title of our page
  Widget title(BuildContext context) => Padding(
      padding: EdgeInsets.all(margin),
      child: Text(
        'Settings',
        style: Theme.of(context).textTheme.headline5,
        textAlign: TextAlign.center,
      ));

  /// A part of the settings
  Widget partHeader(BuildContext context, String partName) => Padding(
      padding: EdgeInsets.all(margin),
      child: Text(
        partName,
        style: Theme.of(context).textTheme.headline6,
        textAlign: TextAlign.center,
      ));

  /// List of statistics
  Widget statistics(BuildContext context, List<Statistic> statistics) =>
      statistics != null && statistics.length > 0
          ? _statisticsListView(context, statistics)
          : _emptyStatistics(context);

  /// Widget containing the list of statistics
  Widget _statisticsListView(
          BuildContext context, List<Statistic> statistics) =>
      StaggeredGridView.countBuilder(
        itemCount: 5,
        crossAxisCount: 2,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (_, index) => Container(
            child: StatisticCardWidget(
          statistic: statistics[index],
        )),
        staggeredTileBuilder: (_) => StaggeredTile.fit(1),
      );

  /// Widget to display when no statistics are present
  Widget _emptyStatistics(BuildContext context) => Text(
        'No statistic, you can create a new one with the button below.',
        style: Theme.of(context).textTheme.bodyText2,
        textAlign: TextAlign.center,
      );

  /// Widget to be displayed when statistics are loading
  Widget loading(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(margin),
            child: Text(
              'Fetching local statistics',
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

  /// Widget used to add a new statistics
  Widget addStatisticsButton(BuildContext context) => RaisedButton(
        onPressed: () {
          _showAddStatisticModal(context);
        },
        color: Theme.of(context).primaryColor,
        child: Text(
          'Create a new statistic',
          style: Theme.of(context).textTheme.button,
        ),
      );

  /// Method used to build the modal for statistic creation
  void _showAddStatisticModal(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return CreateStatisticModal();
        });
  }
}

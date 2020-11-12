import 'package:crypto_benefit/app/domain/object/statistic/statistic.dart';
import 'package:crypto_benefit/app/presentation/modules/settings/create_statistic/create_statistic.modal.dart';
import 'package:crypto_benefit/app/presentation/modules/settings/settings.viewmodel.dart';
import 'package:crypto_benefit/app/presentation/widget/statistic_setting_card.widget.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';
import 'package:crypto_benefit/core/values/dimens.dart';
import 'package:flutter/material.dart';

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
      ListView.builder(
          itemCount: statistics.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(padding),
          itemBuilder: (_, index) {
            final statistic = statistics[index];
            return Container(
                child: StatisticSettingCardWidget(
              statistic: statistic,
              onEditClicked: () =>
                  _showUpdateStatisticModal(context, statistic),
              onDeleteClicked: () => vm.deleteStatistic(statistic),
            ));
          });

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
  Widget createStatisticsButton(BuildContext context) => Padding(
      padding: EdgeInsets.all(padding),
      child: FlatButton(
        padding: EdgeInsets.all(padding),
        onPressed: () {
          _showCreateStatisticModal(context);
        },
        color: Theme.of(context).primaryColor,
        child: Text(
          'Create a new statistic',
          style: Theme.of(context).textTheme.button,
        ),
      ));

  /// Method used to build the modal for statistic creation
  void _showCreateStatisticModal(context) {
    showModalBottomSheet(
        context: context,
        isDismissible: false,
        elevation: 16,
        builder: (BuildContext bc) {
          return CreateStatisticModal();
        });
  }

  /// Method used to display the modal for updateing a statistic
  void _showUpdateStatisticModal(context, statistic) {
    showModalBottomSheet(
        context: context,
        isDismissible: false,
        elevation: 16,
        builder: (BuildContext bc) {
          return CreateStatisticModal(
            statistic: statistic,
          );
        });
  }
}

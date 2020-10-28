import 'package:crypto_benefit/app/domain/object/statistic/statistic.dart';
import 'package:crypto_benefit/app/domain/object/imported_file.dart';
import 'package:crypto_benefit/app/domain/object/transaction_kind.dart';
import 'package:crypto_benefit/app/presentation/widget/base_card.widget.dart';
import 'package:crypto_benefit/core/values/dimens.dart';
import 'package:crypto_benefit/core/values/theme.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

/// A card representing a statistic in the settings page
class StatisticSettingCardWidget extends StatelessWidget {
  /// The statistics to display
  final Statistic statistic;

  // Callback for the different action that can be performed on this view
  final void Function() onEditClicked;
  final void Function() onDeleteClicked;

  const StatisticSettingCardWidget(
      {Key key, this.statistic, this.onEditClicked, this.onDeleteClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) => BaseCardWidget(children: [
        ExpandablePanel(
          theme: getExpandableTheme(context),
          header: Text(
            statistic.name,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          expanded: _expandedBody(context),
        ),
      ]);

  /// The expanded body of our statistic (displaying kind and types concerned)
  Widget _expandedBody(BuildContext context) => Column(
        children: [
          Divider(
            thickness: 1.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: padding),
            child: Text(
              _kindsText(statistic.filter.kinds),
              style: Theme.of(context).textTheme.bodyText2,
              textAlign: TextAlign.start,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: padding),
            child: Text(
              _typesText(statistic.filter.fileTypes),
              style: Theme.of(context).textTheme.bodyText2,
              textAlign: TextAlign.start,
            ),
          ),
          _actionButtons(context)
        ],
      );

  /// The action button to be displayed
  Widget _actionButtons(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: onEditClicked,
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: onDeleteClicked,
          ),
        ],
      );

  String _kindsText(List<TransactionKind> kinds) =>
      kinds != null && kinds.isNotEmpty
          ? 'On kinds : ' + kinds.map((kind) => '${kind.name}').join(', ')
          : 'No filter on kinds';

  String _typesText(List<FileType> types) => types != null && types.isNotEmpty
      ? 'On file types : ' + types.map((type) => '${type.name}').join(', ')
      : 'No filter on file types';
}

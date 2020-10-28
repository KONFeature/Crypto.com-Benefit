import 'package:crypto_benefit/app/domain/object/statistic/statistic.dart';
import 'package:crypto_benefit/app/domain/object/imported_file.dart';
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
  Widget build(BuildContext context) => BaseCardWidget(
        children: [
          ExpandablePanel(
            theme: getExpandableTheme(context),
            header: Text(
              statistic.name,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            expanded: _expandedBody(context),
          ),
        ],
      );

  /// The expanded body of our statistic (displaying kind and types concerned)
  Widget _expandedBody(BuildContext context) => Column(
        children: [
          Divider(
            thickness: 1.0,
          ),
          if (statistic.filter.fileTypes != null &&
              statistic.filter.fileTypes.isNotEmpty)
            _filterCardsPart(
              context,
              'Filter on types : ',
              statistic.filter.fileTypes.map((type) => type.name),
            ),
          if (statistic.filter.kinds != null &&
              statistic.filter.kinds.isNotEmpty)
            _filterCardsPart(
              context,
              'Filter on kinds : ',
              statistic.filter.kinds.map((kind) => kind.name),
            ),
          _actionButtons(context)
        ],
      );

  Widget _filterCardsPart(
          BuildContext context, String title, Iterable<String> filters) =>
      Padding(
        padding: EdgeInsets.symmetric(vertical: padding),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(padding),
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyText2,
                textAlign: TextAlign.start,
              ),
            ),
            Wrap(
              alignment: WrapAlignment.spaceEvenly,
              children: _filterCards(context, filters),
            )
          ],
        ),
      );

  List<Widget> _filterCards(BuildContext context, Iterable<String> filters) =>
      filters
          .map(
            (filter) => Card(
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Theme.of(context).primaryColorDark,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: EdgeInsets.all(smallMargin),
                child: Text(filter),
              ),
            ),
          )
          .toList();

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
}

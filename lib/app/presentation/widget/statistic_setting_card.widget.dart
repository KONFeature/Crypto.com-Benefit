import 'package:crypto_benefit/app/domain/object/statistic/statistic.dart';
import 'package:crypto_benefit/app/domain/object/imported_file.dart';
import 'package:crypto_benefit/app/domain/object/transaction_kind.dart';
import 'package:crypto_benefit/app/presentation/widget/base_card.widget.dart';
import 'package:crypto_benefit/core/values/dimens.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class StatisticSettingCardWidget extends StatelessWidget {
  final Statistic statistic;

  const StatisticSettingCardWidget({Key key, this.statistic}) : super(key: key);

  @override
  Widget build(BuildContext context) => BaseCardWidget(children: [
        ExpandablePanel(
          theme: ExpandableThemeData(
            iconColor: Theme.of(context).textTheme.bodyText1.color,
            tapHeaderToExpand: true,
            headerAlignment: ExpandablePanelHeaderAlignment.center,
          ),
          header: Text(
            statistic.name,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          expanded: Column(
            children: [
              Divider(
                thickness: 1.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: padding),
                child: Text(
                  _kindsText(statistic.kinds),
                  style: Theme.of(context).textTheme.bodyText2,
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: padding),
                child: Text(
                  _typesText(statistic.fileTypes),
                  style: Theme.of(context).textTheme.bodyText2,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ),
      ]);

  String _kindsText(List<TransactionKind> kinds) =>
      kinds != null && kinds.isNotEmpty
          ? 'On kinds : ' + kinds.map((kind) => '${kind.name}').join(', ')
          : 'No filter on kinds';

  String _typesText(List<FileType> types) => types != null && types.isNotEmpty
      ? 'On file types : ' + types.map((type) => '${type.name}').join(', ')
      : 'No filter on file types';
}

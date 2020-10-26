import 'package:crypto_benefit/app/domain/object/statistic/statistic.dart';
import 'package:crypto_benefit/core/values/dimens.dart';
import 'package:flutter/material.dart';

class StatisticCardWidget extends StatelessWidget {
  final Statistic statistic;

  const StatisticCardWidget({Key key, this.statistic}) : super(key: key);

  @override
  Widget build(BuildContext context) => Card(
        elevation: smallElevation,
        child: Container(
          padding: EdgeInsets.all(margin),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: padding),
                child: Text(
                  statistic.name,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Divider(
                thickness: 1.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: padding),
                child: Text(
                  statistic.kinds.toString(),
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: padding),
                child: Text(
                  statistic.fileTypes.toString(),
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ],
          ),
        ),
      );
}

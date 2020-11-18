import 'package:crypto_benefit/app/domain/object/statistic/computed_statistic.dart';
import 'package:crypto_benefit/core/values/dimens.dart';
import 'package:flutter/material.dart';

/// The widget for the computed stat header hero
class ComputedStatHeaderHeroWidget extends StatelessWidget {
  final ComputedStatistic computedStat;

  const ComputedStatHeaderHeroWidget({Key key, this.computedStat})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Hero(
        tag: 'computed_statistic_header',
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: padding),
              child: Text(
                '${computedStat.name}',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Divider(
              thickness: 1.0,
            ),
          ],
        ),
      );
}

import 'package:crypto_benefit/app/domain/object/statistic/computed_statistic.dart';
import 'package:crypto_benefit/core/values/dimens.dart';
import 'package:flutter/material.dart';

import '../transaction_amount_text.widget.dart';

/// The widget for the computed stat header hero
class ComputedStatResumeHeroWidget extends StatelessWidget {
  final ComputedStatistic computedStat;

  const ComputedStatResumeHeroWidget({Key key, this.computedStat})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Hero(
        tag: 'computed_stat_resume_${computedStat.id}',
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: padding),
              child: Text(
                '${computedStat.transactionsCount} transactions',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            TransactionAmountTextWidget(
              text: 'total',
              amount: computedStat.totalUsdAmount,
            ),
            TransactionAmountTextWidget(
              text: 'positive',
              amount: computedStat.positiveUsdAmount,
            ),
            TransactionAmountTextWidget(
              text: 'negative',
              amount: computedStat.negativeUsdAmount,
            ),
          ],
        ),
      );
}

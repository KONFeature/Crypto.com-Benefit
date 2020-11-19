import 'package:crypto_benefit/app/domain/object/statistic/computed_statistic.dart';
import 'package:crypto_benefit/app/presentation/widget/base_card.widget.dart';
import 'package:crypto_benefit/core/values/dimens.dart';
import 'package:flutter/material.dart';

import '../transaction_amount_text.widget.dart';

/// The widget for the computed stat card
class ComputedStatCardWidget extends StatelessWidget {
  // The computed stat we will display
  final ComputedStatistic computedStat;

  /// The callback when the user click on this card
  final VoidCallback onTap;

  const ComputedStatCardWidget({Key key, this.computedStat, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Hero(
        tag: 'computed_statistic_${computedStat.id}',
        child: BaseCardWidget(
          onTap: onTap,
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

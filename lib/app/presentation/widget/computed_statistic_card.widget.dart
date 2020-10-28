import 'package:crypto_benefit/app/domain/object/statistic/computed_statistic.dart';
import 'package:crypto_benefit/app/presentation/widget/base_card.widget.dart';
import 'package:crypto_benefit/app/presentation/widget/transaction_amount_text.widget.dart';
import 'package:crypto_benefit/core/values/dimens.dart';
import 'package:flutter/material.dart';

class ComputedStatisticCardWidget extends StatelessWidget {
  final ComputedStatistic computedStat;

  const ComputedStatisticCardWidget({Key key, this.computedStat})
      : super(key: key);

  @override
  Widget build(BuildContext context) => BaseCardWidget(
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
      );
}

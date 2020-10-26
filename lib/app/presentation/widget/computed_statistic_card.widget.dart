import 'package:crypto_benefit/app/domain/object/statistic/computed_statistic.dart';
import 'package:crypto_benefit/app/presentation/widget/transaction_amount_text.widget.dart';
import 'package:crypto_benefit/core/values/dimens.dart';
import 'package:flutter/material.dart';

class ComputedStatisticCardWidget extends StatelessWidget {
  final ComputedStatistic computedStat;

  const ComputedStatisticCardWidget({Key key, this.computedStat})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Card(
        elevation: noElevation,
        child: Container(
          padding: EdgeInsets.all(margin),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
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
              Padding(
                padding: EdgeInsets.symmetric(vertical: padding),
                child: Text(
                  '${computedStat.transactionsCount} transactions',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              TransactionAmountTextWidget(
                text: 'Native',
                amount: computedStat.totalNativeAmount,
                symbol: '€',
              ),
              TransactionAmountTextWidget(
                text: 'total usd',
                amount: computedStat.totalUsdAmount,
              ),
              TransactionAmountTextWidget(
                text: 'positive usd',
                amount: computedStat.positiveUsdAmount,
              ),
              TransactionAmountTextWidget(
                text: 'negative usd',
                amount: computedStat.negativeUsdAmount,
              ),
            ],
          ),
        ),
      );
}

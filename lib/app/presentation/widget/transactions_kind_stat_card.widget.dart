import 'package:crypto_benefit/app/domain/object/statistic/kind_statistic.dart';
import 'package:crypto_benefit/app/presentation/widget/transaction_amount_text.widget.dart';
import 'package:crypto_benefit/core/values/dimens.dart';
import 'package:flutter/material.dart';

class KindStatCardWidget extends StatelessWidget {
  final KindStatistic transactionKindStats;

  const KindStatCardWidget({Key key, this.transactionKindStats})
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
                  '${transactionKindStats.kindName}',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Divider(
                thickness: 1.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: padding),
                child: Text(
                  '${transactionKindStats.transactionsCount} transactions',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              TransactionAmountTextWidget(
                text: 'Native',
                amount: transactionKindStats.totalNativeAmount,
                symbol: '€',
              ),
              TransactionAmountTextWidget(
                text: 'total usd',
                amount: transactionKindStats.totalUsdAmount,
              ),
              TransactionAmountTextWidget(
                text: 'positive usd',
                amount: transactionKindStats.positiveUsdAmount,
              ),
              TransactionAmountTextWidget(
                text: 'negative usd',
                amount: transactionKindStats.negativeUsdAmount,
              ),
            ],
          ),
        ),
      );
}

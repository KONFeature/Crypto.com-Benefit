import 'package:crypto_benefit/app/domain/object/statistic/file_statistic.dart';
import 'package:crypto_benefit/app/presentation/widget/transaction_amount_text.widget.dart';
import 'package:crypto_benefit/core/values/dimens.dart';
import 'package:flutter/material.dart';

class FileStatCardWidget extends StatelessWidget {
  final FileStatistic transactionFileStats;

  const FileStatCardWidget({Key key, this.transactionFileStats})
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
                  '${transactionFileStats.filetype}',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Divider(
                thickness: 1.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: padding),
                child: Text(
                  '${transactionFileStats.transactionsCount} transactions',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              TransactionAmountTextWidget(
                text: 'Native',
                amount: transactionFileStats.totalNativeAmount,
                symbol: '€',
              ),
              TransactionAmountTextWidget(
                text: 'total usd',
                amount: transactionFileStats.totalUsdAmount,
              ),
              TransactionAmountTextWidget(
                text: 'positive usd',
                amount: transactionFileStats.positiveUsdAmount,
              ),
              TransactionAmountTextWidget(
                text: 'negative usd',
                amount: transactionFileStats.negativeUsdAmount,
              ),
            ],
          ),
        ),
      );
}

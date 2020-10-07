import 'package:crypto_benefit/app/domain/object/transaction_kind_stat.dart';
import 'package:crypto_benefit/core/values/dimens.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StatCardWidget extends StatelessWidget {
  final TransactionStatistic transactionKindStats;

  const StatCardWidget({Key key, this.transactionKindStats}) : super(key: key);

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
                  '${transactionKindStats.transactionKind.name}',
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
              Padding(
                padding: EdgeInsets.symmetric(vertical: padding),
                child: Text(
                  '${NumberFormat.currency(locale: 'eu').format(transactionKindStats.totalNativeAmount)}',
                  style: Theme.of(context).textTheme.bodyText1.apply(
                      color: transactionKindStats.totalNativeAmount > 0
                          ? Colors.greenAccent
                          : Colors.redAccent),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: padding),
                child: Text(
                  'total usd : ${NumberFormat.currency(locale: 'eu', symbol: '\$').format(transactionKindStats.totalUsdAmount)}',
                  style: Theme.of(context).textTheme.bodyText1.apply(
                      color: transactionKindStats.totalUsdAmount > 0
                          ? Colors.greenAccent
                          : Colors.redAccent),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: padding),
                child: Text(
                  'positive usd : ${NumberFormat.currency(locale: 'eu', symbol: '\$').format(transactionKindStats.positiveUsdAmount)}',
                  style: Theme.of(context).textTheme.bodyText1.apply(
                      color: transactionKindStats.positiveUsdAmount > 0
                          ? Colors.greenAccent
                          : Colors.redAccent),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: padding),
                child: Text(
                  'negative usd : ${NumberFormat.currency(locale: 'eu', symbol: '\$').format(transactionKindStats.negativeUsdAmount)}',
                  style: Theme.of(context).textTheme.bodyText1.apply(
                      color: transactionKindStats.negativeUsdAmount > 0
                          ? Colors.greenAccent
                          : Colors.redAccent),
                ),
              ),
            ],
          ),
        ),
      );
}

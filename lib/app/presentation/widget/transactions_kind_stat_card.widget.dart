import 'package:crypto_benefit/app/domain/object/kind_statistic.dart';
import 'package:crypto_benefit/core/values/dimens.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class KindStatCardWidget extends StatelessWidget {
  final KindStatistic transactionKindStats;

  const KindStatCardWidget({Key key, this.transactionKindStats})
      : super(key: key);

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
              Padding(
                padding: EdgeInsets.symmetric(vertical: padding),
                child: Text(
                  '${NumberFormat.currency(locale: 'eu').format(transactionKindStats.totalNativeAmount)}',
                  style: Theme.of(context).textTheme.bodyText1.apply(
                      color: _colorForAmount(
                          context, transactionKindStats.totalNativeAmount)),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: padding),
                child: Text(
                  'total usd : ${NumberFormat.currency(locale: 'eu', symbol: '\$').format(transactionKindStats.totalUsdAmount)}',
                  style: Theme.of(context).textTheme.bodyText1.apply(
                      color: _colorForAmount(
                          context, transactionKindStats.totalUsdAmount)),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: padding),
                child: Text(
                  'positive usd : ${NumberFormat.currency(locale: 'eu', symbol: '\$').format(transactionKindStats.positiveUsdAmount)}',
                  style: Theme.of(context).textTheme.bodyText1.apply(
                      color: _colorForAmount(
                          context, transactionKindStats.positiveUsdAmount)),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: padding),
                child: Text(
                  'negative usd : ${NumberFormat.currency(locale: 'eu', symbol: '\$').format(transactionKindStats.negativeUsdAmount)}',
                  style: Theme.of(context).textTheme.bodyText1.apply(
                      color: _colorForAmount(
                          context, transactionKindStats.negativeUsdAmount)),
                ),
              ),
            ],
          ),
        ),
      );

  Color _colorForAmount(BuildContext context, num amount) {
    if (amount.isNegative) {
      return Colors.redAccent;
    } else if (amount == 0) {
      return Theme.of(context).textTheme.bodyText1.color;
    } else {
      return Colors.greenAccent;
    }
  }
}

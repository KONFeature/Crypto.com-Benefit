import 'package:crypto_benefit/core/values/dimens.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionAmountTextWidget extends StatelessWidget {
  final String text;
  final num amount;
  final String symbol;

  const TransactionAmountTextWidget(
      {Key key, this.text, this.amount, this.symbol = '\$'})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(vertical: padding),
        child: Text(
          '$text : $_formattedAmount',
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .apply(color: _colorForAmount(context, amount)),
        ),
      );

  String get _formattedAmount =>
      NumberFormat.currency(locale: 'eu', symbol: this.symbol)
          .format(amount ?? 0);

  Color _colorForAmount(BuildContext context, num amount) {
    if (amount == null || amount.isNaN || amount == 0) {
      return Theme.of(context).textTheme.bodyText1.color;
    } else if (amount.isNegative) {
      return Colors.redAccent;
    } else {
      return Colors.greenAccent;
    }
  }
}

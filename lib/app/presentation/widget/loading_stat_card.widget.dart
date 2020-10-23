import 'package:crypto_benefit/app/presentation/widget/base_card.widget.dart';
import 'package:crypto_benefit/app/presentation/widget/transaction_amount_text.widget.dart';
import 'package:crypto_benefit/core/values/dimens.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingStatCardWidget extends StatelessWidget {
  const LoadingStatCardWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
      child: BaseCardWidget(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: padding),
            child: Text(
              '',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Divider(
            thickness: 1.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: padding),
            child: Text(
              '',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          TransactionAmountTextWidget(
            text: '',
            amount: 0,
          ),
          TransactionAmountTextWidget(
            text: '',
            amount: 0,
          ),
          TransactionAmountTextWidget(
            text: '',
            amount: 0,
          ),
          TransactionAmountTextWidget(
            text: '',
            amount: 0,
          ),
        ],
      ),
      baseColor: Theme.of(context).cardColor,
      highlightColor: Theme.of(context).backgroundColor);
}

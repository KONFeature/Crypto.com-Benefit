import 'package:crypto_benefit/app/presentation/widget/base_card.widget.dart';
import 'package:crypto_benefit/app/presentation/widget/base_shimmer.widget.dart';
import 'package:crypto_benefit/app/presentation/widget/transaction_amount_text.widget.dart';
import 'package:crypto_benefit/core/values/dimens.dart';
import 'package:flutter/material.dart';

class LoadingStatCardWidget extends StatelessWidget {
  const LoadingStatCardWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BaseCardWidget(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: padding),
            child: BaseShimmerWidget(
              child: Text(
                'Loading statistic title',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ),
          Divider(
            thickness: 1.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: padding),
            child: BaseShimmerWidget(
              child: Text(
                'XXX transactions',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ),
          BaseShimmerWidget(
            child: TransactionAmountTextWidget(
              text: 'total',
              amount: 0,
            ),
          ),
          BaseShimmerWidget(
            child: TransactionAmountTextWidget(
              text: 'positive',
              amount: 0,
            ),
          ),
          BaseShimmerWidget(
            child: TransactionAmountTextWidget(
              text: 'negative',
              amount: 0,
            ),
          ),
        ],
      );
}

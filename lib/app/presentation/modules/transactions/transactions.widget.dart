import 'package:crypto_benefit/app/domain/object/transaction.dart';
import 'package:crypto_benefit/app/presentation/widget/transaction_card.widget.dart';
import 'package:crypto_benefit/core/values/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

/// The widget of the list of transactions pages
class TransactionsWidget {
  /// The title of our page
  Widget title(BuildContext context) => Padding(
      padding: EdgeInsets.all(margin),
      child: Text(
        'Transactions',
        style: Theme.of(context).textTheme.headline5,
        textAlign: TextAlign.center,
      ));

  /// List of transactions
  Widget transactionsImported(
          BuildContext context, List<Transaction> transactions) =>
      transactions != null && transactions.length > 0
          ? _transactionsListView(context, transactions)
          : _noTransactionsImported(context);

  /// Widget containing the list of transactions imported
  Widget _transactionsListView(
          BuildContext context, List<Transaction> transactions) =>
      StaggeredGridView.countBuilder(
        itemCount: transactions.length,
        crossAxisCount: 2,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (_, index) => Container(
            child: TransactionCardWidget(
          transaction: transactions[index],
        )),
        staggeredTileBuilder: (_) => StaggeredTile.fit(1),
      );

  /// Widget to display when no transaction are present
  Widget _noTransactionsImported(BuildContext context) => Text(
        'No transactions were imported, go to the import page and import your Crypto.com CSV export.',
        style: Theme.of(context).textTheme.bodyText2,
        textAlign: TextAlign.center,
      );

  Widget loading(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(margin),
            child: Text(
              'Fetching local transactions',
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(margin),
            child: CircularProgressIndicator(),
          )
        ],
      );
}

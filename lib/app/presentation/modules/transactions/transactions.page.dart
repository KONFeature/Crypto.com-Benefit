import 'package:crypto_benefit/app/presentation/modules/transactions/transactions.widget.dart';
import 'package:crypto_benefit/app/presentation/modules/transactions/transactions.viewmodel.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

/// The transactions page root
class TransactionsPage extends StatefulWidget {
  @override
  _TransactionsPageState createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage>
    with TransactionsWidget {
  final vm = inject<TransactionsViewModel>();

  @override
  void initState() {
    vm.loadTransactions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        title(context),
        Observer(builder: (observerContext) {
          return vm.isLoading
              ? loading(observerContext)
              : transactionsImported(observerContext, vm.transactions);
        }),
      ],
    );
  }
}

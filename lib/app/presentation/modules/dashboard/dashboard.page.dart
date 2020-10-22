import 'package:crypto_benefit/app/presentation/modules/dashboard/dashboard.widget.dart';
import 'package:crypto_benefit/app/presentation/modules/dashboard/dashboard.viewmodel.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

/// The transactions page root
class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> with DashboardWidget {
  final vm = inject<DashboardViewModel>();

  @override
  void initState() {
    vm.loadStats();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Observer(
        builder: (observerContext) => ListView(children: [
          title(context),
          partTitle(context, 'Kind statistics'),
          vm.isLoading
              ? loading(observerContext)
              : kindStats(observerContext, vm.kindStats),
          partTitle(context, 'File statistics'),
          vm.isLoading
              ? loading(observerContext)
              : fileStats(observerContext, vm.fileStats),
        ]),
      );
}

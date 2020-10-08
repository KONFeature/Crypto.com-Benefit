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
  Widget build(BuildContext context) => ListView(
        children: [
          title(context),
          Observer(builder: (observerContext) {
            return vm.isLoading
                ? loading(observerContext)
                : stats(observerContext, vm.kindStats);
          }),
        ],
      );
}

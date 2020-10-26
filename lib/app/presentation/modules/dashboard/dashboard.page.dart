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
  Widget build(BuildContext context) => Observer(
        builder: (observerContext) => ListView(children: [
          title(context),
          vm.isLoading
              ? loading(observerContext)
              : statistics(observerContext, vm.stats),
        ]),
      );
}

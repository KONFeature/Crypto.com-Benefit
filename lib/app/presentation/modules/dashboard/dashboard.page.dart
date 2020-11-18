import 'package:crypto_benefit/app/presentation/modules/dashboard/dashboard.viewmodel.dart';
import 'package:crypto_benefit/app/presentation/modules/dashboard/dashboard.widget.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

/// The dashboard page
class DashboardPage extends StatelessWidget with DashboardWidget {
  /// The view model for this page
  final vm = inject<DashboardViewModel>();

  @override
  Widget build(BuildContext context) => Material(
    child: ListView(
      children: [
        title(context),
        Observer(
          builder: (observerContext) => vm.isLoading
              ? loading(observerContext)
              : statistics(observerContext, vm.stats),
        ),
      ],
    ),
  );
}

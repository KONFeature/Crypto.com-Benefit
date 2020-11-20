import 'package:crypto_benefit/app/domain/object/statistic/computed_statistic.dart';
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
                  : _displayStatistics(observerContext, vm.statistics),
            ),
          ],
        ),
      );

  /// Show a list of statistics or no statistics
  Widget _displayStatistics(BuildContext context, Iterable<ComputedStatistic> stats) =>
      stats != null && stats.length > 0
          ? statisticsWidget(context, stats.toList())
          : noStatistics(context);
}

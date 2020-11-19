import 'package:crypto_benefit/app/domain/object/statistic/computed_statistic.dart';
import 'package:crypto_benefit/app/presentation/modules/stat_detail/stat_detail.viewmodel.dart';
import 'package:crypto_benefit/app/presentation/modules/stat_detail/stat_detail.widget.dart';
import 'package:crypto_benefit/core/values/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

/// The statistic detail page
class StatDetailPage extends StatelessWidget with StatDetailWidget {
  /// The view model (don't use DI because we want a new view model for each view)
  final vm = StatDetailViewModel();

  @override
  Widget build(BuildContext context) {
    // Get the computed stat, and launch the computation in the view model
    final ComputedStatistic computedStat =
        ModalRoute.of(context).settings.arguments;
    vm.computeChart(computedStat);

    // Build the view
    return Hero(
      tag: 'computed_statistic_${computedStat.id}',
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Material(
          type: MaterialType.card,
          borderRadius: BorderRadius.circular(modalBorderRadius),
          child: ListView(
            children: _pageContent(context, computedStat),
          ),
        ),
      ),
    );
  }

  /// Build the content of our page
  List<Widget> _pageContent(
          BuildContext context, ComputedStatistic computedStat) =>
      [
        header(context, computedStat),
        Observer(
            builder: (observerContext) => vm.isLoading
                ? loadingChart(observerContext)
                : testChart(observerContext, vm.statSpots)),
      ];

  @override
  getVm() => vm;
}

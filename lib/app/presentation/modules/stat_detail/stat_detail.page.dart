import 'package:crypto_benefit/app/domain/object/statistic/computed_statistic.dart';
import 'package:crypto_benefit/app/presentation/modules/stat_detail/stat_detail.viewmodel.dart';
import 'package:crypto_benefit/app/presentation/modules/stat_detail/stat_detail.widget.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';
import 'package:crypto_benefit/core/values/dimens.dart';
import 'package:flutter/material.dart';

/// The statistic detail page
class StatDetailPage extends StatelessWidget with StatDetailWidget {
  final vm = inject<StatDetailViewModel>();

  @override
  Widget build(BuildContext context) {
    // Get the computed stat
    final ComputedStatistic computedStat =
        ModalRoute.of(context).settings.arguments;
    print("Generating hero for id : ${computedStat.id}");
    // Build the view
    return Hero(
      tag: 'computed_statistic_${computedStat.id}',
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Material(
          type: MaterialType.card,
          borderRadius: BorderRadius.circular(modalBorderRadius),
          child: ListView(
            children: [
              header(context, computedStat),
              testChart(context),
            ],
          ),
        ),
      ),
    );
  }
}

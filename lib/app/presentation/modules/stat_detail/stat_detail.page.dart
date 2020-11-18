import 'package:crypto_benefit/app/domain/object/statistic/computed_statistic.dart';
import 'package:crypto_benefit/app/presentation/modules/stat_detail/stat_detail.viewmodel.dart';
import 'package:crypto_benefit/app/presentation/modules/stat_detail/stat_detail.widget.dart';
import 'package:crypto_benefit/app/presentation/widget/computed_stat_card/computed_stat_header_hero.widget.dart';
import 'package:crypto_benefit/app/presentation/widget/computed_stat_card/computed_stat_resume_hero.widget.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';
import 'package:crypto_benefit/core/values/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

/// The statistic detail page
class StatDetailPage extends StatelessWidget with StatDetailWidget {
  final vm = inject<StatDetailViewModel>();

  @override
  Widget build(BuildContext context) {
    // Get the computed stat
    final ComputedStatistic computedStat = ModalRoute.of(context).settings.arguments;
    // Build the view
    return Material(
      color: Theme.of(context).cardColor,
      child: ListView(
        children: [
          Hero(
            tag: 'computed_statistic_header',
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: padding),
                  child: title(context, computedStat.name),
                ),
                Divider(
                  thickness: 1.0,
                ),
              ],
            ),
          ),
          loading(context),
        ],
      ),
    );
  }
}

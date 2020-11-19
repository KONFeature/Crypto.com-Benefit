import 'package:crypto_benefit/app/domain/object/statistic/computed_statistic.dart';
import 'package:crypto_benefit/app/presentation/modules/home/home.viewmodel.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';
import 'package:crypto_benefit/core/values/dimens.dart';
import 'package:flutter/material.dart';

import 'stat_detail.viewmodel.dart';

/// The widget for the statistic detail page
abstract class StatDetailWidget {
  /// Find the current view model
  StatDetailViewModel getVm();

  /// The view model for the home page (needed to change route on stat card click)
  final homeVm = inject<HomeViewModel>();

  /// The title of our page
  Widget header(BuildContext context, ComputedStatistic computedStat) => Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: padding),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => homeVm.onBackPressed(),
                ),
                _headerTitle(context, computedStat.name)
              ],
            ),
          ),
          Divider(
            thickness: 1.0,
          ),
        ],
      );

  /// The title of our page
  Widget _headerTitle(BuildContext context, String text) => Padding(
      padding: EdgeInsets.all(margin),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline5,
        textAlign: TextAlign.center,
      ));
}

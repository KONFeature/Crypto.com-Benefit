import 'package:crypto_benefit/app/presentation/widget/loading_stat_card.widget.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';
import 'package:crypto_benefit/core/values/dimens.dart';
import 'package:flutter/material.dart';

import 'stat_detail.viewmodel.dart';

/// The widget for the statistic detail page
class StatDetailWidget {
  final vm = inject<StatDetailViewModel>();

  /// The title of our page
  Widget title(BuildContext context, String text) => Padding(
      padding: EdgeInsets.all(margin),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline5,
        textAlign: TextAlign.center,
      ));

  /// The loading widget to display
  Widget loading(BuildContext context) => GridView.builder(
      itemCount: 2,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      padding: EdgeInsets.all(padding),
      physics: BouncingScrollPhysics(),
      itemBuilder: (_, index) => Container(child: LoadingStatCardWidget()));
}

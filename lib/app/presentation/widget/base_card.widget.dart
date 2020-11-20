import 'package:crypto_benefit/core/values/dimens.dart';
import 'package:flutter/material.dart';

class BaseCardWidget extends StatelessWidget {
  /// The list of widget to display inside the card
  final List<Widget> children;

  /// the function called on a tap of the card
  final VoidCallback onTap;

  const BaseCardWidget({Key key, this.children, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) => Card(
      elevation: noElevation,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        borderRadius: BorderRadius.circular(cardBorderRadius),
        child: Padding(
          padding: EdgeInsets.all(margin),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            spacing: double.infinity,
            runAlignment: WrapAlignment.spaceEvenly,
            children: children,
          ),
        ),
        onTap: onTap,
      ));
}

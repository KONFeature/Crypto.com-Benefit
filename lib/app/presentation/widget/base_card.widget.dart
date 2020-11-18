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
        child: InkWell(
          borderRadius: BorderRadius.circular(4),
          child: Container(
            padding: EdgeInsets.all(margin),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: Column(
              children: children,
            ),
          ),
          onTap: onTap,
        )
      );
}

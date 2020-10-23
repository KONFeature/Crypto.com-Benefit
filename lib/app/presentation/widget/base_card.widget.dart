import 'package:crypto_benefit/core/values/dimens.dart';
import 'package:flutter/material.dart';

class BaseCardWidget extends StatelessWidget {
  final List<Widget> children;

  const BaseCardWidget({Key key, this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) => Card(
        elevation: noElevation,
        child: Container(
          padding: EdgeInsets.all(margin),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: Column(
            children: children,
          ),
        ),
      );
}

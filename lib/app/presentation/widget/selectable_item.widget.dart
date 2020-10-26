import 'package:crypto_benefit/core/values/dimens.dart';
import 'package:flutter/material.dart';
import 'package:selectable_container/selectable_container.dart';

class SelectableItemWidget extends StatelessWidget {
  final String text;
  final bool isSelected;
  final ValueChanged<bool> onChanged;

  const SelectableItemWidget(
      {Key key, this.text, this.isSelected, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) => SelectableContainer(
        elevation: noElevation,
        borderSize: 0,
        onPressed: () {
          onChanged(!isSelected);
        },
        selected: isSelected,
        selectedBackgroundColor: Theme.of(context).accentColor,
        unselectedBackgroundColor: Theme.of(context).cardColor,
        iconSize: 8,
        child: Container(
          padding: EdgeInsets.all(smallMargin),
          child: Text(
            text,
            textAlign: TextAlign.center,
          ),
        ),
      );
}

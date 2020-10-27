import 'package:crypto_benefit/app/domain/object/imported_file.dart';
import 'package:crypto_benefit/app/presentation/modules/settings/create_statistic/create_statistic.viewmodel.dart';
import 'package:crypto_benefit/app/presentation/widget/selectable_item.widget.dart';
import 'package:crypto_benefit/core/values/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';

/// The widget of the list of transactions pages
abstract class CreateStatisticWidget {
  /// Find the current view model
  CreateStatisticViewModel getVm();

  /// The title of our page
  Widget title(BuildContext context) => Padding(
      padding: EdgeInsets.all(margin),
      child: Text('Create statistic',
          style: Theme.of(context).textTheme.headline6,
          textAlign: TextAlign.start));

  /// The title of our page
  Widget partTitle(BuildContext context, String partTitle) => Padding(
      padding: EdgeInsets.all(margin),
      child: Text(partTitle,
          style: Theme.of(context).textTheme.subtitle1,
          textAlign: TextAlign.start));

  /// Widget for the statistic name
  Widget statisticNameInput(BuildContext context) => Padding(
      padding: EdgeInsets.all(margin),
      child: TextFormField(
        initialValue: getVm().initialStatName,
        decoration: InputDecoration(labelText: 'Statistic name'),
        validator: (value) => getVm().validateStatName(value),
      ));

  /// Widget use to let the user select types for his statistics
  Widget typesSelection(BuildContext context) => StaggeredGridView.countBuilder(
        itemCount: getVm().typeSelected.length,
        crossAxisCount: 3,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          final type = getVm().typeSelected.keys.elementAt(index);
          return SelectableItemWidget(
            text: type.name,
            isSelected: getVm().typeSelected[type],
            onChanged: (isSelected) {
              getVm().updateTypeSelection(type, isSelected);
            },
          );
        },
        staggeredTileBuilder: (_) => StaggeredTile.fit(1),
      );

  /// Widget use to let the user select the kinds for his statistics
  Widget kindsSelection(BuildContext context) =>
      getVm().isLoading || getVm().kindSelected.isEmpty
          ? _kindsLoading(context)
          : _kindsCheckboxes(context);

  Widget _kindsLoading(BuildContext context) => StaggeredGridView.countBuilder(
        itemCount: 10,
        crossAxisCount: 2,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Shimmer.fromColors(
              baseColor: Theme.of(context).cardColor,
              highlightColor: Theme.of(context).backgroundColor,
              child: SelectableItemWidget(
                text: '',
                isSelected: false,
                onChanged: (isSelected) {},
              ));
        },
        staggeredTileBuilder: (_) => StaggeredTile.fit(1),
      );

  Widget _kindsCheckboxes(BuildContext context) =>
      StaggeredGridView.countBuilder(
        itemCount: getVm().kindSelected.length,
        crossAxisCount: 2,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          final kind = getVm().kindSelected.keys.elementAt(index);
          return SelectableItemWidget(
            text: kind.name,
            isSelected: getVm().kindSelected[kind],
            onChanged: (isSelected) {
              getVm().updateKindSelection(kind, isSelected);
            },
          );
        },
        staggeredTileBuilder: (_) => StaggeredTile.fit(1),
      );
}

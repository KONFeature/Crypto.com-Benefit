import 'package:crypto_benefit/app/domain/object/transaction_kind.dart';
import 'package:crypto_benefit/app/presentation/modules/settings/create_statistic/create_statistic.viewmodel.dart';
import 'package:crypto_benefit/app/presentation/widget/selectable_item.widget.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';
import 'package:crypto_benefit/core/values/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';

/// The widget of the list of transactions pages
class CreateStatisticWidget {
  final vm = inject<CreateStatisticViewModel>();

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
        decoration: InputDecoration(labelText: 'Statistic name'),
        validator: (value) => vm.validateStatName(value),
      ));

  /// Widget use to let the user select types for his statistics
  Widget typesSelection(BuildContext context) => StaggeredGridView.countBuilder(
        itemCount: vm.typeSelected.length,
        crossAxisCount: 3,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          final type = vm.typeSelected.keys.elementAt(index);
          return SelectableItemWidget(
            text: type.toString(),
            isSelected: vm.typeSelected[type],
            onChanged: (isSelected) {
              vm.updateTypeSelection(type, isSelected);
            },
          );
        },
        staggeredTileBuilder: (_) => StaggeredTile.fit(1),
      );

  /// Widget use to let the user select the kinds for his statistics
  Widget kindsSelection(BuildContext context) =>
      vm.isLoading || vm.kindSelected.isEmpty
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
        itemCount: vm.kindSelected.length,
        crossAxisCount: 2,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          final kind = vm.kindSelected.keys.elementAt(index);
          return SelectableItemWidget(
            text: kind.name,
            isSelected: vm.kindSelected[kind],
            onChanged: (isSelected) {
              vm.updateKindSelection(kind, isSelected);
            },
          );
        },
        staggeredTileBuilder: (_) => StaggeredTile.fit(1),
      );
}

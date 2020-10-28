import 'package:crypto_benefit/app/domain/object/imported_file.dart';
import 'package:crypto_benefit/app/presentation/modules/settings/create_statistic/create_statistic.viewmodel.dart';
import 'package:crypto_benefit/app/presentation/widget/selectable_item.widget.dart';
import 'package:crypto_benefit/core/values/dimens.dart';
import 'package:flutter/material.dart';

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
  Widget typesSelection(BuildContext context) {
    final types = getVm().typeSelected.keys;
    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      children: types
          .map((type) => SelectableItemWidget(
                text: type.name,
                isSelected: getVm().typeSelected[type],
                onChanged: (isSelected) {
                  getVm().updateTypeSelection(type, isSelected);
                },
              ))
          .toList(),
    );
  }

  /// Widget use to let the user select the kinds for his statistics
  Widget kindsSelection(BuildContext context) =>
      getVm().isKindLoading || getVm().kindSelected.isEmpty
          ? _kindsLoading(context)
          : _kindsCheckboxes(context);

  /// Listview of the transaction kinds loading
  Widget _kindsLoading(BuildContext context) => Padding(
        padding: EdgeInsets.all(margin),
        child: CircularProgressIndicator(),
      );

  /// List of checkboxes for the transactions kinds
  Widget _kindsCheckboxes(BuildContext context) {
    final kinds = getVm().kindSelected.keys.toList();
    kinds.sort((ka, kb) => ka.name.compareTo(kb.name));
    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      children: kinds
          .map((kind) => SelectableItemWidget(
                text: kind.name,
                isSelected: getVm().kindSelected[kind],
                onChanged: (isSelected) {
                  getVm().updateKindSelection(kind, isSelected);
                },
              ))
          .toList(),
    );
  }
}

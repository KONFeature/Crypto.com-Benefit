import 'package:crypto_benefit/app/domain/object/imported_file.dart';
import 'package:crypto_benefit/app/presentation/modules/settings/create_statistic/create_statistic.viewmodel.dart';
import 'package:crypto_benefit/core/values/dimens.dart';
import 'package:flutter/material.dart';

/// The widget for our create statistic modal.
abstract class CreateStatisticWidget {
  /// Find the current view model
  CreateStatisticViewModel getVm();

  /// The title of our page
  Widget title(BuildContext context) => Padding(
        padding: EdgeInsets.all(margin),
        child: Text('Create statistic',
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.start),
      );

  /// The title of our page
  Widget partTitle(BuildContext context, String partTitle) => Padding(
        padding: EdgeInsets.all(margin),
        child: Text(partTitle,
            style: Theme.of(context).textTheme.subtitle1,
            textAlign: TextAlign.start),
      );

  /// Widget for the statistic name
  Widget statisticNameInput(BuildContext context) => Padding(
        padding: EdgeInsets.all(margin),
        child: TextFormField(
          initialValue: getVm().initialStatName,
          decoration: InputDecoration(labelText: 'Statistic name'),
          validator: (value) => getVm().validateStatName(value),
        ),
      );

  /// Widget use to let the user select types for his statistics
  Widget typesSelectionChips(BuildContext context) {
    final types = getVm().typeSelected.keys;
    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      children: types
          .map(
            (type) => Padding(
              child: FilterChip(
                label: Text(type.name),
                selectedColor: Theme.of(context).accentColor,
                selected: getVm().typeSelected[type],
                onSelected: (isSelected) {
                  getVm().updateTypeSelection(type, isSelected);
                },
              ),
              padding: EdgeInsets.symmetric(horizontal: padding),
            ),
          )
          .toList(),
    );
  }

  /// Widget use to let the user select the kinds for his statistics
  Widget kindsSelection(BuildContext context) =>
      getVm().isKindLoading || getVm().kindSelected.isEmpty
          ? _kindsLoading(context)
          : _kindsSelectionChips(context);

  /// Listview of the transaction kinds loading
  Widget _kindsLoading(BuildContext context) => Padding(
        padding: EdgeInsets.all(margin),
        child: CircularProgressIndicator(),
      );

  /// List of checkboxes for the transactions kinds
  Widget _kindsSelectionChips(BuildContext context) {
    final kinds = getVm().kindSelected.keys.toList();
    kinds.sort((ka, kb) => ka.name.compareTo(kb.name));
    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      children: kinds
          .map(
            (kind) => Padding(
              child: FilterChip(
                label: Text(kind.name),
                selectedColor: Theme.of(context).accentColor,
                selected: getVm().kindSelected[kind],
                onSelected: (isSelected) {
                  getVm().updateKindSelection(kind, isSelected);
                },
              ),
              padding: EdgeInsets.symmetric(horizontal: padding),
            ),
          )
          .toList(),
    );
  }
}

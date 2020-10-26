import 'package:crypto_benefit/app/presentation/modules/settings/create_statistic/create_statistic.viewmodel.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';
import 'package:crypto_benefit/core/values/dimens.dart';
import 'package:flutter/material.dart';

/// The widget of the list of transactions pages
class CreateStatisticWidget {
  final vm = inject<CreateStatisticViewModel>();

  /// The title of our page
  Widget title(BuildContext context) => Padding(
      padding: EdgeInsets.all(margin),
      child: Text('Create statistic',
          style: Theme.of(context).textTheme.headline6,
          textAlign: TextAlign.start));

  /// Widget for the statistic name
  Widget statisticNameInput(BuildContext context) => TextFormField(
        decoration: InputDecoration(labelText: 'Statistic name'),
        // TODO : Validator in vm
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter a statistic name';
          }
          return null;
        },
      );

  /// Wiidget use to let the user select types for his statistics
  Widget typesSelection(BuildContext context) => ListView.builder(
        itemCount: vm.typeSelected.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          final type = vm.typeSelected.keys.elementAt(index);
          return CheckboxListTile(
            title: Text(type.toString()),
            value: vm.typeSelected[type],
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (isSelected) {
              vm.updateTypeSelection(type, isSelected);
            },
          );
        },
      );
}

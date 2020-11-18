import 'package:crypto_benefit/app/domain/object/statistic/statistic.dart';
import 'package:crypto_benefit/app/presentation/modules/settings/create_statistic/create_statistic.viewmodel.dart';
import 'package:crypto_benefit/app/presentation/modules/settings/create_statistic/create_statistic.widget.dart';
import 'package:crypto_benefit/core/values/theme.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

/// The create statistic modal
class CreateStatisticModal extends StatelessWidget with CreateStatisticWidget {
  /// The view model (don't use DI because we want a new view model for each view)
  final vm = CreateStatisticViewModel();

  /// Key for our create stat form
  final _formKey = GlobalKey<FormState>();

  /// The base statistic object (in case of an update) can be null for creation
  final Statistic statistic;

  CreateStatisticModal({this.statistic}) {
    // If we got a statistic we send it to the view model and he will prepapre the field accordingly
    if (statistic != null) vm.initStatisticUpdate(statistic);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: [
        Row(
          children: [
            title(context),
            Expanded(
              child: Container(),
            ),
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
        Form(key: _formKey, child: _formContent(context)),
      ],
    ));
  }

  /// Get the content for our form
  Widget _formContent(BuildContext context) => Column(
        children: [
          // Input for the name of the statistic
          statisticNameInput(context),
          // List of available types
          partTitle(context, 'File types for your statistic'),
          Observer(
              builder: (observerContext) => typesSelection(observerContext)),
          // List of available kinds
          ExpandablePanel(
              theme: getExpandableTheme(context),
              header:
                  partTitle(context, 'Transaction kinds for your statistic'),
              expanded: Observer(
                builder: (observerContext) => kindsSelection(context),
              )),
          // kindsSelection(context),
          // Button to submit the statistic creation
          _submitButton(context),
        ],
      );

  /// Button used to submit the statistic creation
  Widget _submitButton(BuildContext context) => FlatButton(
        onPressed: () async {
          if (_formKey.currentState.validate()) {
            // Perform the creation and then popup the model
            await vm.launchStatisticCreateOrUpdate();
            Navigator.pop(context);
          }
        },
        color: Theme.of(context).primaryColor,
        child: Text(
          vm.textActionButton,
          style: Theme.of(context).textTheme.button,
        ),
      );

  @override
  getVm() => vm;
}

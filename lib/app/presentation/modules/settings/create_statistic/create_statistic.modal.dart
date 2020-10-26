import 'package:crypto_benefit/app/presentation/modules/settings/create_statistic/create_statistic.widget.dart';
import 'package:crypto_benefit/app/presentation/modules/settings/create_statistic/create_statistic.viewmodel.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

/// The create statistic modal root
class CreateStatisticModal extends StatefulWidget {
  @override
  _CreateStatisticModalState createState() => _CreateStatisticModalState();
}

class _CreateStatisticModalState extends State<CreateStatisticModal>
    with CreateStatisticWidget {
  final vm = inject<CreateStatisticViewModel>();

  /// Key for our create stat form
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: [
        title(context),
        Form(
            key: _formKey,
            child: Observer(
                builder: (observerContext) => _formContent(observerContext))),
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
          typesSelection(context),
          // List of available kinds
          partTitle(context, 'Transaction kinds for your statistic'),
          kindsSelection(context),
          // Button to submit the statistic creation
          _submitButton(context),
        ],
      );

  /// Button used to submit the statistic creation
  Widget _submitButton(BuildContext context) => RaisedButton(
        onPressed: () {
          if (_formKey.currentState.validate()) {
            // TODO : View model, create the stat
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text('Processing Data')));
          }
        },
        color: Theme.of(context).primaryColor,
        child: Text(
          'Create',
          style: Theme.of(context).textTheme.button,
        ),
      );
}

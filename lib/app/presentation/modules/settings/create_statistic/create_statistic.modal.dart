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
        Observer(
            builder: (observerContext) => Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Input for the name of the statistic
                      // List of available types
                      statisticNameInput(observerContext),
                      // TODO : Wrap in an observer
                      ListView.builder(
                        itemCount: vm.kinds != null ? vm.kinds.length : 0,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          var kind = vm.kinds[index];
                          return CheckboxListTile(
                            title: Text(kind.name),
                            value: true,
                            onChanged: (newValue) {
                              setState(() {
                                // TODO : View model
                              });
                            },
                            controlAffinity: ListTileControlAffinity
                                .leading, //  <-- leading Checkbox
                          );
                        },
                      ),
                      // Button to submit the statistic creation
                      RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            // TODO : View model, create the stat
                            Scaffold.of(observerContext).showSnackBar(
                                SnackBar(content: Text('Processing Data')));
                          }
                        },
                        color: Theme.of(observerContext).primaryColor,
                        child: Text(
                          'Create',
                          style: Theme.of(observerContext).textTheme.button,
                        ),
                      )
                    ],
                  ),
                )),
      ],
    ));
  }
}

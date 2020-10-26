import 'package:crypto_benefit/app/presentation/modules/settings/settings.widget.dart';
import 'package:crypto_benefit/app/presentation/modules/settings/settings.viewmodel.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

/// The settings page root
class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> with SettingsWidget {
  final vm = inject<SettingsViewModel>();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        title(context),
        partHeader(context, 'Statistics'),
        Observer(builder: (observerContext) {
          return vm.isLoading
              ? loading(observerContext)
              : statistics(observerContext, vm.transactions);
        }),
        addStatisticsButton(context)
      ],
    );
  }
}

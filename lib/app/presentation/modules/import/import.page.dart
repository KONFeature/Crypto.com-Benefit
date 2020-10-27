import 'package:crypto_benefit/app/presentation/modules/import/import.viewmodel.dart';
import 'package:crypto_benefit/app/presentation/modules/import/import.widget.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

/// The import page root
class ImportPage extends StatelessWidget with ImportWidget {
  final vm = inject<ImportViewModel>();

  @override
  Widget build(BuildContext context) => ListView(
        children: [
          title(context),
          Observer(
            builder: (observerContext) =>
                filesImported(observerContext, vm.importedFilesStream.value),
          ),
          buttons(context),
        ],
      );
}

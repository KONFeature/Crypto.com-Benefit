import 'package:crypto_benefit/app/presentation/modules/import/import.viewmodel.dart';
import 'package:crypto_benefit/app/presentation/modules/import/import.widget.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

/// The import page root
class ImportPage extends StatefulWidget {
  @override
  _ImportPageState createState() => _ImportPageState();
}

class _ImportPageState extends State<ImportPage> with ImportWidget {
  final vm = inject<ImportViewModel>();

  @override
  void initState() {
    vm.listenToImportedFile();
    super.initState();
  }

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

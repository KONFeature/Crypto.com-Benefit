import 'package:crypto_benefit/app/domain/object/imported_file.dart';
import 'package:crypto_benefit/app/presentation/modules/import/import.viewmodel.dart';
import 'package:crypto_benefit/app/presentation/widget/imported_file_card.widget.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';
import 'package:crypto_benefit/core/values/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

/// The widget of the import pages
class ImportWidget {
  final vm = inject<ImportViewModel>();

  /// The title of our page
  Widget title(BuildContext context) => Padding(
      padding: EdgeInsets.all(margin),
      child: Text(
        'Manage csv files imported',
        style: Theme.of(context).textTheme.headline5,
        textAlign: TextAlign.center,
      ));

  /// Button to manage the imports
  Widget buttons(BuildContext context) => Padding(
      padding: EdgeInsets.all(margin),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RaisedButton(
            // Button to launch the csv import
            onPressed: () => vm.import(),
            color: Theme.of(context).primaryColor,
            child: Text(
              'Import CSV',
              style: Theme.of(context).textTheme.button,
            ),
          ),
          FlatButton(
            // Button to clear all the previous imports
            onPressed: () => vm.clearImports(),
            color: Theme.of(context).primaryColor,
            child: Text(
              'Clear imports',
              style: Theme.of(context).textTheme.button,
            ),
          ),
        ],
      ));

  /// List of files imported
  Widget filesImported(
          BuildContext context, List<ImportedFile> importedFiles) =>
      importedFiles != null && importedFiles.length > 0
          ? _filesListView(context, importedFiles)
          : _noFileImported(context);

  /// Widget containing the list of files imported
  Widget _filesListView(
          BuildContext context, List<ImportedFile> importedFiles) =>
      StaggeredGridView.countBuilder(
        itemCount: importedFiles.length,
        crossAxisCount: 1,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(padding),
        itemBuilder: (_, index) => Container(
            child: ImportedFileCardWidget(
          importedFile: importedFiles[index],
        )),
        staggeredTileBuilder: (_) => StaggeredTile.fit(1),
      );

  /// Widget to display when no files are imported
  Widget _noFileImported(BuildContext context) => Text(
        'No files are imported',
        style: Theme.of(context).textTheme.bodyText2,
        textAlign: TextAlign.center,
      );
}

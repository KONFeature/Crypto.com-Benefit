import 'package:crypto_benefit/app/domain/object/imported_file.dart';
import 'package:crypto_benefit/app/presentation/widget/base_card.widget.dart';
import 'package:crypto_benefit/core/values/dimens.dart';
import 'package:flutter/material.dart';

class ImportedFileCardWidget extends StatelessWidget {
  final ImportedFile importedFile;

  const ImportedFileCardWidget({Key key, this.importedFile}) : super(key: key);

  @override
  Widget build(BuildContext context) => BaseCardWidget(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: padding),
            child: Text(
              'Name : ${importedFile.filename}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: padding),
            child: Text(
              'Contains ${importedFile.type.name}',
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: padding),
            child: Text(
              'Generated the ${importedFile.generatedTimestamp.toString()}',
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
        ],
      );
}

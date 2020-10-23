import 'dart:io';

import 'package:crypto_benefit/app/data/sources/database/tables/imported_files.table.dart';
import 'package:crypto_benefit/app/data/sources/database/tables/statistics.table.dart';
import 'package:crypto_benefit/app/data/sources/database/tables/transaction_kinds.table.dart';
import 'package:crypto_benefit/app/data/sources/database/tables/transactions.table.dart';
import 'package:encrypted_moor/encrypted_moor.dart';
import 'package:flutter/cupertino.dart';
import 'package:moor/moor.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'app_database.g.dart';

// Define the file who while contain the database
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    // Find the file for the database
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    // Create the dart encrypted database arround the file
    return EncryptedExecutor(
        path: file.path,
        password:
            'MySuperStrongPassword', // TODO : Externalize this password to a safer place
        logStatements: false,
        singleInstance: true);
  });
}

// The application database (link to entity and some helpful method)
@UseMoor(tables: [
  ImportedFilesTable,
  TransactionKindsTable,
  TransactionsTable,
  StatisticTable,
  StatisticKindsTable,
  StatisticFilesTable
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

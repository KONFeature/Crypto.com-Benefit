import 'package:crypto_benefit/app/domain/object/imported_file.dart';
import 'package:crypto_benefit/app/domain/object/transaction.dart';

/// Class representing an imported file with his transactions
class ImportedFileWithTransactions {
  final ImportedFile importedFile;
  final List<Transaction> transactions;

  ImportedFileWithTransactions({
    this.importedFile,
    this.transactions,
  });
}

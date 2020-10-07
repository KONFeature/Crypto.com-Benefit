/// Simple class representing our imported file
class ImportedFile {
  final int id;
  final String filename;
  final FileType type;
  final DateTime generatedTimestamp;
  final DateTime importedTimestamp;

  ImportedFile(
      {this.id,
      this.filename,
      this.generatedTimestamp,
      this.importedTimestamp,
      this.type});
}

/// Enum representing the different file type than can be imported in the app
enum FileType { cardTransaction, fiatTransactions, cryptoTransactions }

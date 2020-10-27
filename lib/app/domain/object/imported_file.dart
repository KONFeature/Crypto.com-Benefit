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

/// Extenstion on our enum, to get better string representation
extension FileTypeExtension on FileType {
  /// Return a litteral for our enum
  String get name {
    switch (this) {
      case FileType.cardTransaction:
        return 'Card transactions';
      case FileType.fiatTransactions:
        return 'Fiat transactions';
      case FileType.cryptoTransactions:
        return 'Crypto transactions';
      default:
        return null;
    }
  }
}

import 'package:flutter/foundation.dart';

/// Simple class representing our imported file
class ImportedFile {
  final int id;
  final String filename;
  final FileType type;
  final DateTime generatedTimestamp;
  final DateTime importedTimestamp;

  ImportedFile({
    @required this.id,
    @required this.filename,
    @required this.generatedTimestamp,
    @required this.importedTimestamp,
    @required this.type,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImportedFile &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
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
        return 'Unknwon';
    }
  }
}

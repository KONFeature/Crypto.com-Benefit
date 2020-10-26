import 'package:crypto_benefit/app/domain/object/imported_file.dart';
import 'package:crypto_benefit/app/domain/object/transaction_kind.dart';

/// Simple class representing a the stats of transactions
class Statistic {
  /// Name of this stats
  final String name;

  /// Kind linked to this statistic
  final List<TransactionKind> kinds;

  /// Types linked to this statistic
  final List<FileType> fileTypes;

  Statistic({
    this.name,
    this.kinds,
    this.fileTypes,
  });
}

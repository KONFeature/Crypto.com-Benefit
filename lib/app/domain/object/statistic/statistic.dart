import 'package:crypto_benefit/app/domain/object/imported_file.dart';
import 'package:crypto_benefit/app/domain/object/transaction_kind.dart';

/// Simple class representing a the stats of transactions
class Statistic {
  /// The id of this stat
  final int id;

  /// Name of this stats
  final String name;

  /// The filter to get the transaction matching this statistic
  final Filter filter;

  Statistic({this.id, this.name, this.filter});
}

/// Simple class representing a transaction filter for a statistic
class Filter {
  /// The id of this filter
  final int id;

  /// Kind linked to this filter
  final List<TransactionKind> kinds;

  /// Types linked to this statistic
  final List<FileType> fileTypes;

  Filter({
    this.id,
    this.kinds,
    this.fileTypes,
  });
}

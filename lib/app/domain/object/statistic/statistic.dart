import 'package:crypto_benefit/app/domain/object/imported_file.dart';
import 'package:crypto_benefit/app/domain/object/transaction_kind.dart';
import 'package:flutter/foundation.dart';

/// Simple class representing a the stats of transactions
class Statistic {
  /// The id of this stat
  final int id;

  /// Name of this stats
  final String name;

  /// The filter to get the transaction matching this statistic
  final Filter filter;

  Statistic({
    @required this.id,
    @required this.name,
    this.filter,
  });
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
    @required this.id,
    @required this.kinds,
    @required this.fileTypes,
  });
}

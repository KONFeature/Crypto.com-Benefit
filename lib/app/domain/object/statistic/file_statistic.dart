import 'package:crypto_benefit/app/domain/object/statistic/statistic.dart';

/// Simple class representing a the stats of transactions for a specific file type
class FileStatistic extends Statistic {
  final String filetype;

  FileStatistic({
    this.filetype,
    var transactionsCount,
    var totalNativeAmount,
    var totalUsdAmount,
    var positiveUsdAmount,
    var negativeUsdAmount,
  }) : super(
          transactionsCount: transactionsCount,
          totalUsdAmount: totalUsdAmount,
          positiveUsdAmount: positiveUsdAmount,
          negativeUsdAmount: negativeUsdAmount,
        );
}

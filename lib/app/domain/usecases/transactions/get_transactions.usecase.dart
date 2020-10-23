import 'package:crypto_benefit/app/domain/object/transaction.dart';
import 'package:crypto_benefit/app/domain/repositories/transaction.repository.dart';
import 'package:crypto_benefit/app/domain/usecases/usecase.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';

/// Use case used to fetch all the imported file
class WatchTransactionsUseCase
    implements StreamUseCase<List<Transaction>, void> {
  final _transactionRepository = inject<ITransactionRepository>();

  @override
  Stream<List<Transaction>> get(void params) =>
      _transactionRepository.watchTransactions();
}

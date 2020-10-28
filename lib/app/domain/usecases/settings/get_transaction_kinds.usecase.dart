import 'package:crypto_benefit/app/domain/object/transaction_kind.dart';
import 'package:crypto_benefit/app/domain/repositories/transaction_kind.repository.dart';
import 'package:crypto_benefit/app/domain/usecases/usecase.dart';
import 'package:crypto_benefit/core/di/injector_provider.dart';

/// Use case used to fetch all the imported file
class GetTransactionKindsUseCase
    implements BaseUseCase<Iterable<TransactionKind>, void> {
  final _transactionKindRepository = inject<ITransactionKindRepository>();

  @override
  Future<Iterable<TransactionKind>> execute(void params) =>
      _transactionKindRepository.getTransactionKinds();
}

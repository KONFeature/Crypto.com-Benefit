/// Abtrsact class representing a simple use case
abstract class BaseUseCase<TResult, TParams> {
  Future<TResult> execute(TParams params);
}

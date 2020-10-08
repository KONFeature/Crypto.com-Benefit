/// Abtrsact class representing a simple use case
abstract class BaseUseCase<TResult, TParams> {
  Future<TResult> execute(TParams params);
}

/// Abtrsact class representing a use case returning a stream
abstract class StreamUseCase<TResult, TParams> {
  Stream<TResult> get(TParams params);
}

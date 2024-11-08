enum FailureCode {
  unknown;
}

sealed class Result<T extends Object> {}

class SuccessResult<T extends Object> extends Result<T> {
  SuccessResult({
    required this.value,
  });

  final T value;
}

class FailureResult<T extends Object> extends Result<T> {
  FailureResult({
    required this.failure,
  });

  final FailureCode failure;
}

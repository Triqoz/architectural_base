/// Shared base class for results.
sealed class Result<T> {}

/// Indicates that the result was a success and contains a value of type `T`.
class SuccessResult<T> extends Result<T> {
  /// Constructs a failure result with a required value.
  SuccessResult._({
    required T Function() valueResolver,
  }) : _valueResolver = valueResolver;

  /// Creates a successful [Result] containing a value.
  factory SuccessResult.createWithValue(T value) {

    assert(
      value != null,
      'Supplied value should not be null. Use the `createWithoutValue` method to communicate a success result without returning a value.',
    );

    return SuccessResult<T>._(valueResolver: () => value);
  }

  /// Creates a successful [Result] without a value (type `void`).
  ///
  /// Because there is no value, accessing the [value] field will throw an
  /// [UnimplementedError].
  factory SuccessResult.createWithoutValue() {
    return SuccessResult<T>._(
      valueResolver: () => throw UnimplementedError(),
    );
  }

  final T Function() _valueResolver;

  /// The value of the result.
  T get value => _valueResolver();
}

/// Indicates that the result was a failure and contains a failure code.
class FailureResult<T> extends Result<T> {
  /// Constructs a failure result with a required [FailureCode].
  FailureResult._({
    required this.failure,
  });

  factory FailureResult.create(FailureCode failure) {
    return FailureResult<T>._(failure: failure);
  }

  /// The [FailureCode] of the result.
  final FailureCode failure;
}

/// An enumeration that represents the possible failure codes of a result.
enum FailureCode {
  /// Example failure.
  notFound,

  /// Unknown placeholder failure.
  unknown, validationError, networkError, unauthorized;
}

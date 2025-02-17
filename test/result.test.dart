import 'package:architectural_base/src/core/result/result.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Result', () {
    group('SuccessResult', () {
      test('createWithValue should store and return the value correctly', () {
        final SuccessResult<int> intResult =
            SuccessResult<int>.createWithValue(42);
        expect(intResult.value, equals(42));

        final SuccessResult<String> stringResult =
            SuccessResult<String>.createWithValue('test');
        expect(stringResult.value, equals('test'));

        final SuccessResult<List<int>> listResult =
            SuccessResult<List<int>>.createWithValue(<int>[1, 2, 3]);
        expect(listResult.value, equals(<int>[1, 2, 3]));
      });

      test('createWithoutValue should create a void result', () {
        final SuccessResult<void> voidResult =
            SuccessResult<void>.createWithoutValue();
        expect(voidResult, isA<SuccessResult<void>>());
        expect(
          () => voidResult.value,
          throwsA(isA<UnimplementedError>()),
        );
      });

      test('success results should be of the correct type', () {
        final SuccessResult<int> intResult =
            SuccessResult<int>.createWithValue(42);
        expect(intResult, isA<Result<int>>());
        expect(intResult, isA<SuccessResult<int>>());

        final SuccessResult<void> voidResult =
            SuccessResult<void>.createWithoutValue();
        expect(voidResult, isA<Result<void>>());
        expect(voidResult, isA<SuccessResult<void>>());
      });
    });

    group('FailureResult', () {
      test('create should store and return the failure code correctly', () {
        const FailureCode failure = FailureCode.networkError;
        final FailureResult<int> failureResult =
            FailureResult<int>.create(failure);
        expect(failureResult.failure, equals(FailureCode.networkError));
      });

      test('failure results should work with void type', () {
        const FailureCode failure = FailureCode.validationError;
        final FailureResult<void> voidFailureResult =
            FailureResult<void>.create(failure);
        expect(voidFailureResult, isA<Result<void>>());
        expect(voidFailureResult, isA<FailureResult<void>>());
        expect(voidFailureResult.failure, equals(FailureCode.validationError));
      });

      test('failure results should be of the correct type', () {
        const FailureCode failure = FailureCode.notFound;

        final FailureResult<int> intFailureResult =
            FailureResult<int>.create(failure);
        expect(intFailureResult, isA<Result<int>>());
        expect(intFailureResult, isA<FailureResult<int>>());

        final FailureResult<String> stringFailureResult =
            FailureResult<String>.create(failure);
        expect(stringFailureResult, isA<Result<String>>());
        expect(stringFailureResult, isA<FailureResult<String>>());
      });
    });

    test('should handle nullable types correctly', () {
      expect(
        () => SuccessResult<int?>.createWithValue(null),
        throwsA(isA<AssertionError>()),
      );

      final FailureResult<int?> nullableFailure =
          FailureResult<int>.create(FailureCode.unauthorized);
      expect(nullableFailure.failure, equals(FailureCode.unauthorized));
    });
  });
}

import 'package:base_de_projet/domain/core/failures.dart';
import 'package:dartz/dartz.dart';

Either<ValueFailure<String>, String> validateTableId(String input) {
  if (input.contains('Table-') && input[0] == 'T' && input[1] == 'a') {
    return right(input);
  } else {
    return left(
      ValueFailure.invalidTableId(failedValue: input),
    );
  }
}

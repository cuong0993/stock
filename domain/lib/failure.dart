import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  // TODO Add more Firebase errors.
  const factory Failure.serverError() = _FailureServerError;
}

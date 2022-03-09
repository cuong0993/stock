import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  factory User({
    required String id,
    required String name,
    required String photoUrl,
    required List<String> tokens,
    required DateTime creationTime,
  }) = _User;
}

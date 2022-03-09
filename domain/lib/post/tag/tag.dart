import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag.freezed.dart';

@freezed
class Tag with _$Tag {
  factory Tag({
    required String name,
    required String id,
  }) = _Tag;
}

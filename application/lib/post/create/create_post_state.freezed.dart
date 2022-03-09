// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'create_post_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CreatePostStateTearOff {
  const _$CreatePostStateTearOff();

  _CreatePostState call(
      {required List<String> imageUrls,
      required List<String> tags,
      required String text,
      required String name,
      required List<DateTime> timeSlots}) {
    return _CreatePostState(
      imageUrls: imageUrls,
      tags: tags,
      text: text,
      name: name,
      timeSlots: timeSlots,
    );
  }
}

/// @nodoc
const $CreatePostState = _$CreatePostStateTearOff();

/// @nodoc
mixin _$CreatePostState {
  List<String> get imageUrls => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<DateTime> get timeSlots => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreatePostStateCopyWith<CreatePostState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatePostStateCopyWith<$Res> {
  factory $CreatePostStateCopyWith(
          CreatePostState value, $Res Function(CreatePostState) then) =
      _$CreatePostStateCopyWithImpl<$Res>;
  $Res call(
      {List<String> imageUrls,
      List<String> tags,
      String text,
      String name,
      List<DateTime> timeSlots});
}

/// @nodoc
class _$CreatePostStateCopyWithImpl<$Res>
    implements $CreatePostStateCopyWith<$Res> {
  _$CreatePostStateCopyWithImpl(this._value, this._then);

  final CreatePostState _value;
  // ignore: unused_field
  final $Res Function(CreatePostState) _then;

  @override
  $Res call({
    Object? imageUrls = freezed,
    Object? tags = freezed,
    Object? text = freezed,
    Object? name = freezed,
    Object? timeSlots = freezed,
  }) {
    return _then(_value.copyWith(
      imageUrls: imageUrls == freezed
          ? _value.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      timeSlots: timeSlots == freezed
          ? _value.timeSlots
          : timeSlots // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
    ));
  }
}

/// @nodoc
abstract class _$CreatePostStateCopyWith<$Res>
    implements $CreatePostStateCopyWith<$Res> {
  factory _$CreatePostStateCopyWith(
          _CreatePostState value, $Res Function(_CreatePostState) then) =
      __$CreatePostStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<String> imageUrls,
      List<String> tags,
      String text,
      String name,
      List<DateTime> timeSlots});
}

/// @nodoc
class __$CreatePostStateCopyWithImpl<$Res>
    extends _$CreatePostStateCopyWithImpl<$Res>
    implements _$CreatePostStateCopyWith<$Res> {
  __$CreatePostStateCopyWithImpl(
      _CreatePostState _value, $Res Function(_CreatePostState) _then)
      : super(_value, (v) => _then(v as _CreatePostState));

  @override
  _CreatePostState get _value => super._value as _CreatePostState;

  @override
  $Res call({
    Object? imageUrls = freezed,
    Object? tags = freezed,
    Object? text = freezed,
    Object? name = freezed,
    Object? timeSlots = freezed,
  }) {
    return _then(_CreatePostState(
      imageUrls: imageUrls == freezed
          ? _value.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      timeSlots: timeSlots == freezed
          ? _value.timeSlots
          : timeSlots // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
    ));
  }
}

/// @nodoc

class _$_CreatePostState implements _CreatePostState {
  _$_CreatePostState(
      {required this.imageUrls,
      required this.tags,
      required this.text,
      required this.name,
      required this.timeSlots});

  @override
  final List<String> imageUrls;
  @override
  final List<String> tags;
  @override
  final String text;
  @override
  final String name;
  @override
  final List<DateTime> timeSlots;

  @override
  String toString() {
    return 'CreatePostState(imageUrls: $imageUrls, tags: $tags, text: $text, name: $name, timeSlots: $timeSlots)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreatePostState &&
            const DeepCollectionEquality().equals(other.imageUrls, imageUrls) &&
            const DeepCollectionEquality().equals(other.tags, tags) &&
            const DeepCollectionEquality().equals(other.text, text) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.timeSlots, timeSlots));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(imageUrls),
      const DeepCollectionEquality().hash(tags),
      const DeepCollectionEquality().hash(text),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(timeSlots));

  @JsonKey(ignore: true)
  @override
  _$CreatePostStateCopyWith<_CreatePostState> get copyWith =>
      __$CreatePostStateCopyWithImpl<_CreatePostState>(this, _$identity);
}

abstract class _CreatePostState implements CreatePostState {
  factory _CreatePostState(
      {required List<String> imageUrls,
      required List<String> tags,
      required String text,
      required String name,
      required List<DateTime> timeSlots}) = _$_CreatePostState;

  @override
  List<String> get imageUrls;
  @override
  List<String> get tags;
  @override
  String get text;
  @override
  String get name;
  @override
  List<DateTime> get timeSlots;
  @override
  @JsonKey(ignore: true)
  _$CreatePostStateCopyWith<_CreatePostState> get copyWith =>
      throw _privateConstructorUsedError;
}

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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
abstract class _$$_CreatePostStateCopyWith<$Res>
    implements $CreatePostStateCopyWith<$Res> {
  factory _$$_CreatePostStateCopyWith(
          _$_CreatePostState value, $Res Function(_$_CreatePostState) then) =
      __$$_CreatePostStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<String> imageUrls,
      List<String> tags,
      String text,
      String name,
      List<DateTime> timeSlots});
}

/// @nodoc
class __$$_CreatePostStateCopyWithImpl<$Res>
    extends _$CreatePostStateCopyWithImpl<$Res>
    implements _$$_CreatePostStateCopyWith<$Res> {
  __$$_CreatePostStateCopyWithImpl(
      _$_CreatePostState _value, $Res Function(_$_CreatePostState) _then)
      : super(_value, (v) => _then(v as _$_CreatePostState));

  @override
  _$_CreatePostState get _value => super._value as _$_CreatePostState;

  @override
  $Res call({
    Object? imageUrls = freezed,
    Object? tags = freezed,
    Object? text = freezed,
    Object? name = freezed,
    Object? timeSlots = freezed,
  }) {
    return _then(_$_CreatePostState(
      imageUrls: imageUrls == freezed
          ? _value._imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tags: tags == freezed
          ? _value._tags
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
          ? _value._timeSlots
          : timeSlots // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
    ));
  }
}

/// @nodoc

class _$_CreatePostState implements _CreatePostState {
  _$_CreatePostState(
      {required final List<String> imageUrls,
      required final List<String> tags,
      required this.text,
      required this.name,
      required final List<DateTime> timeSlots})
      : _imageUrls = imageUrls,
        _tags = tags,
        _timeSlots = timeSlots;

  final List<String> _imageUrls;
  @override
  List<String> get imageUrls {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageUrls);
  }

  final List<String> _tags;
  @override
  List<String> get tags {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final String text;
  @override
  final String name;
  final List<DateTime> _timeSlots;
  @override
  List<DateTime> get timeSlots {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_timeSlots);
  }

  @override
  String toString() {
    return 'CreatePostState(imageUrls: $imageUrls, tags: $tags, text: $text, name: $name, timeSlots: $timeSlots)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreatePostState &&
            const DeepCollectionEquality()
                .equals(other._imageUrls, _imageUrls) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(other.text, text) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other._timeSlots, _timeSlots));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_imageUrls),
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(text),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(_timeSlots));

  @JsonKey(ignore: true)
  @override
  _$$_CreatePostStateCopyWith<_$_CreatePostState> get copyWith =>
      __$$_CreatePostStateCopyWithImpl<_$_CreatePostState>(this, _$identity);
}

abstract class _CreatePostState implements CreatePostState {
  factory _CreatePostState(
      {required final List<String> imageUrls,
      required final List<String> tags,
      required final String text,
      required final String name,
      required final List<DateTime> timeSlots}) = _$_CreatePostState;

  @override
  List<String> get imageUrls => throw _privateConstructorUsedError;
  @override
  List<String> get tags => throw _privateConstructorUsedError;
  @override
  String get text => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  List<DateTime> get timeSlots => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CreatePostStateCopyWith<_$_CreatePostState> get copyWith =>
      throw _privateConstructorUsedError;
}

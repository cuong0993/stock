// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'like.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LikeTearOff {
  const _$LikeTearOff();

  _Like call(
      {required String userName,
      required String userId,
      required String postId,
      required String userPhotoUrl,
      required DateTime createdDate,
      required String id}) {
    return _Like(
      userName: userName,
      userId: userId,
      postId: postId,
      userPhotoUrl: userPhotoUrl,
      createdDate: createdDate,
      id: id,
    );
  }
}

/// @nodoc
const $Like = _$LikeTearOff();

/// @nodoc
mixin _$Like {
  String get userName => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get postId => throw _privateConstructorUsedError;
  String get userPhotoUrl => throw _privateConstructorUsedError;
  DateTime get createdDate => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LikeCopyWith<Like> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikeCopyWith<$Res> {
  factory $LikeCopyWith(Like value, $Res Function(Like) then) =
      _$LikeCopyWithImpl<$Res>;
  $Res call(
      {String userName,
      String userId,
      String postId,
      String userPhotoUrl,
      DateTime createdDate,
      String id});
}

/// @nodoc
class _$LikeCopyWithImpl<$Res> implements $LikeCopyWith<$Res> {
  _$LikeCopyWithImpl(this._value, this._then);

  final Like _value;
  // ignore: unused_field
  final $Res Function(Like) _then;

  @override
  $Res call({
    Object? userName = freezed,
    Object? userId = freezed,
    Object? postId = freezed,
    Object? userPhotoUrl = freezed,
    Object? createdDate = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      userPhotoUrl: userPhotoUrl == freezed
          ? _value.userPhotoUrl
          : userPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: createdDate == freezed
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$LikeCopyWith<$Res> implements $LikeCopyWith<$Res> {
  factory _$LikeCopyWith(_Like value, $Res Function(_Like) then) =
      __$LikeCopyWithImpl<$Res>;
  @override
  $Res call(
      {String userName,
      String userId,
      String postId,
      String userPhotoUrl,
      DateTime createdDate,
      String id});
}

/// @nodoc
class __$LikeCopyWithImpl<$Res> extends _$LikeCopyWithImpl<$Res>
    implements _$LikeCopyWith<$Res> {
  __$LikeCopyWithImpl(_Like _value, $Res Function(_Like) _then)
      : super(_value, (v) => _then(v as _Like));

  @override
  _Like get _value => super._value as _Like;

  @override
  $Res call({
    Object? userName = freezed,
    Object? userId = freezed,
    Object? postId = freezed,
    Object? userPhotoUrl = freezed,
    Object? createdDate = freezed,
    Object? id = freezed,
  }) {
    return _then(_Like(
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      userPhotoUrl: userPhotoUrl == freezed
          ? _value.userPhotoUrl
          : userPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: createdDate == freezed
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Like implements _Like {
  _$_Like(
      {required this.userName,
      required this.userId,
      required this.postId,
      required this.userPhotoUrl,
      required this.createdDate,
      required this.id});

  @override
  final String userName;
  @override
  final String userId;
  @override
  final String postId;
  @override
  final String userPhotoUrl;
  @override
  final DateTime createdDate;
  @override
  final String id;

  @override
  String toString() {
    return 'Like(userName: $userName, userId: $userId, postId: $postId, userPhotoUrl: $userPhotoUrl, createdDate: $createdDate, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Like &&
            const DeepCollectionEquality().equals(other.userName, userName) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.postId, postId) &&
            const DeepCollectionEquality()
                .equals(other.userPhotoUrl, userPhotoUrl) &&
            const DeepCollectionEquality()
                .equals(other.createdDate, createdDate) &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userName),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(postId),
      const DeepCollectionEquality().hash(userPhotoUrl),
      const DeepCollectionEquality().hash(createdDate),
      const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  _$LikeCopyWith<_Like> get copyWith =>
      __$LikeCopyWithImpl<_Like>(this, _$identity);
}

abstract class _Like implements Like {
  factory _Like(
      {required String userName,
      required String userId,
      required String postId,
      required String userPhotoUrl,
      required DateTime createdDate,
      required String id}) = _$_Like;

  @override
  String get userName;
  @override
  String get userId;
  @override
  String get postId;
  @override
  String get userPhotoUrl;
  @override
  DateTime get createdDate;
  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$LikeCopyWith<_Like> get copyWith => throw _privateConstructorUsedError;
}
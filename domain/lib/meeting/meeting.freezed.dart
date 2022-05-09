// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'meeting.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Meeting {
  Map<String, bool> get participantIds => throw _privateConstructorUsedError;
  Map<String, String> get participantNames =>
      throw _privateConstructorUsedError;
  Map<String, String> get participantUrls => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime get time => throw _privateConstructorUsedError;
  String get createdUserId => throw _privateConstructorUsedError;
  int get participantCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MeetingCopyWith<Meeting> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeetingCopyWith<$Res> {
  factory $MeetingCopyWith(Meeting value, $Res Function(Meeting) then) =
      _$MeetingCopyWithImpl<$Res>;
  $Res call(
      {Map<String, bool> participantIds,
      Map<String, String> participantNames,
      Map<String, String> participantUrls,
      String id,
      String name,
      DateTime time,
      String createdUserId,
      int participantCount});
}

/// @nodoc
class _$MeetingCopyWithImpl<$Res> implements $MeetingCopyWith<$Res> {
  _$MeetingCopyWithImpl(this._value, this._then);

  final Meeting _value;
  // ignore: unused_field
  final $Res Function(Meeting) _then;

  @override
  $Res call({
    Object? participantIds = freezed,
    Object? participantNames = freezed,
    Object? participantUrls = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? time = freezed,
    Object? createdUserId = freezed,
    Object? participantCount = freezed,
  }) {
    return _then(_value.copyWith(
      participantIds: participantIds == freezed
          ? _value.participantIds
          : participantIds // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      participantNames: participantNames == freezed
          ? _value.participantNames
          : participantNames // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      participantUrls: participantUrls == freezed
          ? _value.participantUrls
          : participantUrls // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdUserId: createdUserId == freezed
          ? _value.createdUserId
          : createdUserId // ignore: cast_nullable_to_non_nullable
              as String,
      participantCount: participantCount == freezed
          ? _value.participantCount
          : participantCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_MeetingCopyWith<$Res> implements $MeetingCopyWith<$Res> {
  factory _$$_MeetingCopyWith(
          _$_Meeting value, $Res Function(_$_Meeting) then) =
      __$$_MeetingCopyWithImpl<$Res>;
  @override
  $Res call(
      {Map<String, bool> participantIds,
      Map<String, String> participantNames,
      Map<String, String> participantUrls,
      String id,
      String name,
      DateTime time,
      String createdUserId,
      int participantCount});
}

/// @nodoc
class __$$_MeetingCopyWithImpl<$Res> extends _$MeetingCopyWithImpl<$Res>
    implements _$$_MeetingCopyWith<$Res> {
  __$$_MeetingCopyWithImpl(_$_Meeting _value, $Res Function(_$_Meeting) _then)
      : super(_value, (v) => _then(v as _$_Meeting));

  @override
  _$_Meeting get _value => super._value as _$_Meeting;

  @override
  $Res call({
    Object? participantIds = freezed,
    Object? participantNames = freezed,
    Object? participantUrls = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? time = freezed,
    Object? createdUserId = freezed,
    Object? participantCount = freezed,
  }) {
    return _then(_$_Meeting(
      participantIds: participantIds == freezed
          ? _value._participantIds
          : participantIds // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      participantNames: participantNames == freezed
          ? _value._participantNames
          : participantNames // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      participantUrls: participantUrls == freezed
          ? _value._participantUrls
          : participantUrls // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdUserId: createdUserId == freezed
          ? _value.createdUserId
          : createdUserId // ignore: cast_nullable_to_non_nullable
              as String,
      participantCount: participantCount == freezed
          ? _value.participantCount
          : participantCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Meeting implements _Meeting {
  _$_Meeting(
      {required final Map<String, bool> participantIds,
      required final Map<String, String> participantNames,
      required final Map<String, String> participantUrls,
      required this.id,
      required this.name,
      required this.time,
      required this.createdUserId,
      required this.participantCount})
      : _participantIds = participantIds,
        _participantNames = participantNames,
        _participantUrls = participantUrls;

  final Map<String, bool> _participantIds;
  @override
  Map<String, bool> get participantIds {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_participantIds);
  }

  final Map<String, String> _participantNames;
  @override
  Map<String, String> get participantNames {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_participantNames);
  }

  final Map<String, String> _participantUrls;
  @override
  Map<String, String> get participantUrls {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_participantUrls);
  }

  @override
  final String id;
  @override
  final String name;
  @override
  final DateTime time;
  @override
  final String createdUserId;
  @override
  final int participantCount;

  @override
  String toString() {
    return 'Meeting(participantIds: $participantIds, participantNames: $participantNames, participantUrls: $participantUrls, id: $id, name: $name, time: $time, createdUserId: $createdUserId, participantCount: $participantCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Meeting &&
            const DeepCollectionEquality()
                .equals(other._participantIds, _participantIds) &&
            const DeepCollectionEquality()
                .equals(other._participantNames, _participantNames) &&
            const DeepCollectionEquality()
                .equals(other._participantUrls, _participantUrls) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.time, time) &&
            const DeepCollectionEquality()
                .equals(other.createdUserId, createdUserId) &&
            const DeepCollectionEquality()
                .equals(other.participantCount, participantCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_participantIds),
      const DeepCollectionEquality().hash(_participantNames),
      const DeepCollectionEquality().hash(_participantUrls),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(time),
      const DeepCollectionEquality().hash(createdUserId),
      const DeepCollectionEquality().hash(participantCount));

  @JsonKey(ignore: true)
  @override
  _$$_MeetingCopyWith<_$_Meeting> get copyWith =>
      __$$_MeetingCopyWithImpl<_$_Meeting>(this, _$identity);
}

abstract class _Meeting implements Meeting {
  factory _Meeting(
      {required final Map<String, bool> participantIds,
      required final Map<String, String> participantNames,
      required final Map<String, String> participantUrls,
      required final String id,
      required final String name,
      required final DateTime time,
      required final String createdUserId,
      required final int participantCount}) = _$_Meeting;

  @override
  Map<String, bool> get participantIds => throw _privateConstructorUsedError;
  @override
  Map<String, String> get participantNames =>
      throw _privateConstructorUsedError;
  @override
  Map<String, String> get participantUrls => throw _privateConstructorUsedError;
  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  DateTime get time => throw _privateConstructorUsedError;
  @override
  String get createdUserId => throw _privateConstructorUsedError;
  @override
  int get participantCount => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_MeetingCopyWith<_$_Meeting> get copyWith =>
      throw _privateConstructorUsedError;
}

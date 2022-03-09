// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'conversation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ConversationTearOff {
  const _$ConversationTearOff();

  _Conversation call(
      {required List<String> participantIds,
      required Map<String, int> lastViews,
      required String id}) {
    return _Conversation(
      participantIds: participantIds,
      lastViews: lastViews,
      id: id,
    );
  }
}

/// @nodoc
const $Conversation = _$ConversationTearOff();

/// @nodoc
mixin _$Conversation {
  List<String> get participantIds => throw _privateConstructorUsedError;
  Map<String, int> get lastViews => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConversationCopyWith<Conversation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversationCopyWith<$Res> {
  factory $ConversationCopyWith(
          Conversation value, $Res Function(Conversation) then) =
      _$ConversationCopyWithImpl<$Res>;
  $Res call(
      {List<String> participantIds, Map<String, int> lastViews, String id});
}

/// @nodoc
class _$ConversationCopyWithImpl<$Res> implements $ConversationCopyWith<$Res> {
  _$ConversationCopyWithImpl(this._value, this._then);

  final Conversation _value;
  // ignore: unused_field
  final $Res Function(Conversation) _then;

  @override
  $Res call({
    Object? participantIds = freezed,
    Object? lastViews = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      participantIds: participantIds == freezed
          ? _value.participantIds
          : participantIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastViews: lastViews == freezed
          ? _value.lastViews
          : lastViews // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ConversationCopyWith<$Res>
    implements $ConversationCopyWith<$Res> {
  factory _$ConversationCopyWith(
          _Conversation value, $Res Function(_Conversation) then) =
      __$ConversationCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<String> participantIds, Map<String, int> lastViews, String id});
}

/// @nodoc
class __$ConversationCopyWithImpl<$Res> extends _$ConversationCopyWithImpl<$Res>
    implements _$ConversationCopyWith<$Res> {
  __$ConversationCopyWithImpl(
      _Conversation _value, $Res Function(_Conversation) _then)
      : super(_value, (v) => _then(v as _Conversation));

  @override
  _Conversation get _value => super._value as _Conversation;

  @override
  $Res call({
    Object? participantIds = freezed,
    Object? lastViews = freezed,
    Object? id = freezed,
  }) {
    return _then(_Conversation(
      participantIds: participantIds == freezed
          ? _value.participantIds
          : participantIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastViews: lastViews == freezed
          ? _value.lastViews
          : lastViews // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Conversation implements _Conversation {
  _$_Conversation(
      {required this.participantIds,
      required this.lastViews,
      required this.id});

  @override
  final List<String> participantIds;
  @override
  final Map<String, int> lastViews;
  @override
  final String id;

  @override
  String toString() {
    return 'Conversation(participantIds: $participantIds, lastViews: $lastViews, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Conversation &&
            const DeepCollectionEquality()
                .equals(other.participantIds, participantIds) &&
            const DeepCollectionEquality().equals(other.lastViews, lastViews) &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(participantIds),
      const DeepCollectionEquality().hash(lastViews),
      const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  _$ConversationCopyWith<_Conversation> get copyWith =>
      __$ConversationCopyWithImpl<_Conversation>(this, _$identity);
}

abstract class _Conversation implements Conversation {
  factory _Conversation(
      {required List<String> participantIds,
      required Map<String, int> lastViews,
      required String id}) = _$_Conversation;

  @override
  List<String> get participantIds;
  @override
  Map<String, int> get lastViews;
  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$ConversationCopyWith<_Conversation> get copyWith =>
      throw _privateConstructorUsedError;
}

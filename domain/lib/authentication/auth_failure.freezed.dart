// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cancelledByUser,
    required TResult Function() serverError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? cancelledByUser,
    TResult Function()? serverError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cancelledByUser,
    TResult Function()? serverError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthFailureCancelledByUser value) cancelledByUser,
    required TResult Function(AuthFailureServerError value) serverError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthFailureCancelledByUser value)? cancelledByUser,
    TResult Function(AuthFailureServerError value)? serverError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthFailureCancelledByUser value)? cancelledByUser,
    TResult Function(AuthFailureServerError value)? serverError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthFailureCopyWith<$Res> {
  factory $AuthFailureCopyWith(
          AuthFailure value, $Res Function(AuthFailure) then) =
      _$AuthFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthFailureCopyWithImpl<$Res> implements $AuthFailureCopyWith<$Res> {
  _$AuthFailureCopyWithImpl(this._value, this._then);

  final AuthFailure _value;
  // ignore: unused_field
  final $Res Function(AuthFailure) _then;
}

/// @nodoc
abstract class _$$AuthFailureCancelledByUserCopyWith<$Res> {
  factory _$$AuthFailureCancelledByUserCopyWith(
          _$AuthFailureCancelledByUser value,
          $Res Function(_$AuthFailureCancelledByUser) then) =
      __$$AuthFailureCancelledByUserCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthFailureCancelledByUserCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res>
    implements _$$AuthFailureCancelledByUserCopyWith<$Res> {
  __$$AuthFailureCancelledByUserCopyWithImpl(
      _$AuthFailureCancelledByUser _value,
      $Res Function(_$AuthFailureCancelledByUser) _then)
      : super(_value, (v) => _then(v as _$AuthFailureCancelledByUser));

  @override
  _$AuthFailureCancelledByUser get _value =>
      super._value as _$AuthFailureCancelledByUser;
}

/// @nodoc

class _$AuthFailureCancelledByUser implements AuthFailureCancelledByUser {
  const _$AuthFailureCancelledByUser();

  @override
  String toString() {
    return 'AuthFailure.cancelledByUser()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthFailureCancelledByUser);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cancelledByUser,
    required TResult Function() serverError,
  }) {
    return cancelledByUser();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? cancelledByUser,
    TResult Function()? serverError,
  }) {
    return cancelledByUser?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cancelledByUser,
    TResult Function()? serverError,
    required TResult orElse(),
  }) {
    if (cancelledByUser != null) {
      return cancelledByUser();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthFailureCancelledByUser value) cancelledByUser,
    required TResult Function(AuthFailureServerError value) serverError,
  }) {
    return cancelledByUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthFailureCancelledByUser value)? cancelledByUser,
    TResult Function(AuthFailureServerError value)? serverError,
  }) {
    return cancelledByUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthFailureCancelledByUser value)? cancelledByUser,
    TResult Function(AuthFailureServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (cancelledByUser != null) {
      return cancelledByUser(this);
    }
    return orElse();
  }
}

abstract class AuthFailureCancelledByUser implements AuthFailure {
  const factory AuthFailureCancelledByUser() = _$AuthFailureCancelledByUser;
}

/// @nodoc
abstract class _$$AuthFailureServerErrorCopyWith<$Res> {
  factory _$$AuthFailureServerErrorCopyWith(_$AuthFailureServerError value,
          $Res Function(_$AuthFailureServerError) then) =
      __$$AuthFailureServerErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthFailureServerErrorCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res>
    implements _$$AuthFailureServerErrorCopyWith<$Res> {
  __$$AuthFailureServerErrorCopyWithImpl(_$AuthFailureServerError _value,
      $Res Function(_$AuthFailureServerError) _then)
      : super(_value, (v) => _then(v as _$AuthFailureServerError));

  @override
  _$AuthFailureServerError get _value =>
      super._value as _$AuthFailureServerError;
}

/// @nodoc

class _$AuthFailureServerError implements AuthFailureServerError {
  const _$AuthFailureServerError();

  @override
  String toString() {
    return 'AuthFailure.serverError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthFailureServerError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cancelledByUser,
    required TResult Function() serverError,
  }) {
    return serverError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? cancelledByUser,
    TResult Function()? serverError,
  }) {
    return serverError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cancelledByUser,
    TResult Function()? serverError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthFailureCancelledByUser value) cancelledByUser,
    required TResult Function(AuthFailureServerError value) serverError,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthFailureCancelledByUser value)? cancelledByUser,
    TResult Function(AuthFailureServerError value)? serverError,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthFailureCancelledByUser value)? cancelledByUser,
    TResult Function(AuthFailureServerError value)? serverError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class AuthFailureServerError implements AuthFailure {
  const factory AuthFailureServerError() = _$AuthFailureServerError;
}

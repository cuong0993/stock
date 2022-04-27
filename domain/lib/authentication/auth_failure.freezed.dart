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
abstract class $AuthFailureCancelledByUserCopyWith<$Res> {
  factory $AuthFailureCancelledByUserCopyWith(AuthFailureCancelledByUser value,
          $Res Function(AuthFailureCancelledByUser) then) =
      _$AuthFailureCancelledByUserCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthFailureCancelledByUserCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res>
    implements $AuthFailureCancelledByUserCopyWith<$Res> {
  _$AuthFailureCancelledByUserCopyWithImpl(AuthFailureCancelledByUser _value,
      $Res Function(AuthFailureCancelledByUser) _then)
      : super(_value, (v) => _then(v as AuthFailureCancelledByUser));

  @override
  AuthFailureCancelledByUser get _value =>
      super._value as AuthFailureCancelledByUser;
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
            other is AuthFailureCancelledByUser);
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
abstract class $AuthFailureServerErrorCopyWith<$Res> {
  factory $AuthFailureServerErrorCopyWith(AuthFailureServerError value,
          $Res Function(AuthFailureServerError) then) =
      _$AuthFailureServerErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthFailureServerErrorCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res>
    implements $AuthFailureServerErrorCopyWith<$Res> {
  _$AuthFailureServerErrorCopyWithImpl(AuthFailureServerError _value,
      $Res Function(AuthFailureServerError) _then)
      : super(_value, (v) => _then(v as AuthFailureServerError));

  @override
  AuthFailureServerError get _value => super._value as AuthFailureServerError;
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
        (other.runtimeType == runtimeType && other is AuthFailureServerError);
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

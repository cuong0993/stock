// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'authentication_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthenticationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() authenticated,
    required TResult Function() unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? authenticated,
    TResult Function()? unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? authenticated,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthenticationStateLoading value) loading,
    required TResult Function(AuthenticationStateAuthenticated value)
        authenticated,
    required TResult Function(AuthenticationStateUnauthenticated value)
        unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthenticationStateLoading value)? loading,
    TResult Function(AuthenticationStateAuthenticated value)? authenticated,
    TResult Function(AuthenticationStateUnauthenticated value)? unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthenticationStateLoading value)? loading,
    TResult Function(AuthenticationStateAuthenticated value)? authenticated,
    TResult Function(AuthenticationStateUnauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationStateCopyWith<$Res> {
  factory $AuthenticationStateCopyWith(
          AuthenticationState value, $Res Function(AuthenticationState) then) =
      _$AuthenticationStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthenticationStateCopyWithImpl<$Res>
    implements $AuthenticationStateCopyWith<$Res> {
  _$AuthenticationStateCopyWithImpl(this._value, this._then);

  final AuthenticationState _value;
  // ignore: unused_field
  final $Res Function(AuthenticationState) _then;
}

/// @nodoc
abstract class _$$AuthenticationStateLoadingCopyWith<$Res> {
  factory _$$AuthenticationStateLoadingCopyWith(
          _$AuthenticationStateLoading value,
          $Res Function(_$AuthenticationStateLoading) then) =
      __$$AuthenticationStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthenticationStateLoadingCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements _$$AuthenticationStateLoadingCopyWith<$Res> {
  __$$AuthenticationStateLoadingCopyWithImpl(
      _$AuthenticationStateLoading _value,
      $Res Function(_$AuthenticationStateLoading) _then)
      : super(_value, (v) => _then(v as _$AuthenticationStateLoading));

  @override
  _$AuthenticationStateLoading get _value =>
      super._value as _$AuthenticationStateLoading;
}

/// @nodoc

class _$AuthenticationStateLoading implements AuthenticationStateLoading {
  _$AuthenticationStateLoading();

  @override
  String toString() {
    return 'AuthenticationState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticationStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() authenticated,
    required TResult Function() unauthenticated,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? authenticated,
    TResult Function()? unauthenticated,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? authenticated,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthenticationStateLoading value) loading,
    required TResult Function(AuthenticationStateAuthenticated value)
        authenticated,
    required TResult Function(AuthenticationStateUnauthenticated value)
        unauthenticated,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthenticationStateLoading value)? loading,
    TResult Function(AuthenticationStateAuthenticated value)? authenticated,
    TResult Function(AuthenticationStateUnauthenticated value)? unauthenticated,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthenticationStateLoading value)? loading,
    TResult Function(AuthenticationStateAuthenticated value)? authenticated,
    TResult Function(AuthenticationStateUnauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AuthenticationStateLoading implements AuthenticationState {
  factory AuthenticationStateLoading() = _$AuthenticationStateLoading;
}

/// @nodoc
abstract class _$$AuthenticationStateAuthenticatedCopyWith<$Res> {
  factory _$$AuthenticationStateAuthenticatedCopyWith(
          _$AuthenticationStateAuthenticated value,
          $Res Function(_$AuthenticationStateAuthenticated) then) =
      __$$AuthenticationStateAuthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthenticationStateAuthenticatedCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements _$$AuthenticationStateAuthenticatedCopyWith<$Res> {
  __$$AuthenticationStateAuthenticatedCopyWithImpl(
      _$AuthenticationStateAuthenticated _value,
      $Res Function(_$AuthenticationStateAuthenticated) _then)
      : super(_value, (v) => _then(v as _$AuthenticationStateAuthenticated));

  @override
  _$AuthenticationStateAuthenticated get _value =>
      super._value as _$AuthenticationStateAuthenticated;
}

/// @nodoc

class _$AuthenticationStateAuthenticated
    implements AuthenticationStateAuthenticated {
  _$AuthenticationStateAuthenticated();

  @override
  String toString() {
    return 'AuthenticationState.authenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticationStateAuthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() authenticated,
    required TResult Function() unauthenticated,
  }) {
    return authenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? authenticated,
    TResult Function()? unauthenticated,
  }) {
    return authenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? authenticated,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthenticationStateLoading value) loading,
    required TResult Function(AuthenticationStateAuthenticated value)
        authenticated,
    required TResult Function(AuthenticationStateUnauthenticated value)
        unauthenticated,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthenticationStateLoading value)? loading,
    TResult Function(AuthenticationStateAuthenticated value)? authenticated,
    TResult Function(AuthenticationStateUnauthenticated value)? unauthenticated,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthenticationStateLoading value)? loading,
    TResult Function(AuthenticationStateAuthenticated value)? authenticated,
    TResult Function(AuthenticationStateUnauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class AuthenticationStateAuthenticated implements AuthenticationState {
  factory AuthenticationStateAuthenticated() =
      _$AuthenticationStateAuthenticated;
}

/// @nodoc
abstract class _$$AuthenticationStateUnauthenticatedCopyWith<$Res> {
  factory _$$AuthenticationStateUnauthenticatedCopyWith(
          _$AuthenticationStateUnauthenticated value,
          $Res Function(_$AuthenticationStateUnauthenticated) then) =
      __$$AuthenticationStateUnauthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthenticationStateUnauthenticatedCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements _$$AuthenticationStateUnauthenticatedCopyWith<$Res> {
  __$$AuthenticationStateUnauthenticatedCopyWithImpl(
      _$AuthenticationStateUnauthenticated _value,
      $Res Function(_$AuthenticationStateUnauthenticated) _then)
      : super(_value, (v) => _then(v as _$AuthenticationStateUnauthenticated));

  @override
  _$AuthenticationStateUnauthenticated get _value =>
      super._value as _$AuthenticationStateUnauthenticated;
}

/// @nodoc

class _$AuthenticationStateUnauthenticated
    implements AuthenticationStateUnauthenticated {
  _$AuthenticationStateUnauthenticated();

  @override
  String toString() {
    return 'AuthenticationState.unauthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticationStateUnauthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() authenticated,
    required TResult Function() unauthenticated,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? authenticated,
    TResult Function()? unauthenticated,
  }) {
    return unauthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? authenticated,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthenticationStateLoading value) loading,
    required TResult Function(AuthenticationStateAuthenticated value)
        authenticated,
    required TResult Function(AuthenticationStateUnauthenticated value)
        unauthenticated,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthenticationStateLoading value)? loading,
    TResult Function(AuthenticationStateAuthenticated value)? authenticated,
    TResult Function(AuthenticationStateUnauthenticated value)? unauthenticated,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthenticationStateLoading value)? loading,
    TResult Function(AuthenticationStateAuthenticated value)? authenticated,
    TResult Function(AuthenticationStateUnauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class AuthenticationStateUnauthenticated
    implements AuthenticationState {
  factory AuthenticationStateUnauthenticated() =
      _$AuthenticationStateUnauthenticated;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notes_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NotesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() noResults,
    required TResult Function(List<NotesModel> data) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? noResults,
    TResult? Function(List<NotesModel> data)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? noResults,
    TResult Function(List<NotesModel> data)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingNotesState value) loading,
    required TResult Function(NoResultsNotesState value) noResults,
    required TResult Function(LoadedNotesState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingNotesState value)? loading,
    TResult? Function(NoResultsNotesState value)? noResults,
    TResult? Function(LoadedNotesState value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingNotesState value)? loading,
    TResult Function(NoResultsNotesState value)? noResults,
    TResult Function(LoadedNotesState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotesStateCopyWith<$Res> {
  factory $NotesStateCopyWith(
          NotesState value, $Res Function(NotesState) then) =
      _$NotesStateCopyWithImpl<$Res, NotesState>;
}

/// @nodoc
class _$NotesStateCopyWithImpl<$Res, $Val extends NotesState>
    implements $NotesStateCopyWith<$Res> {
  _$NotesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadingNotesStateImplCopyWith<$Res> {
  factory _$$LoadingNotesStateImplCopyWith(_$LoadingNotesStateImpl value,
          $Res Function(_$LoadingNotesStateImpl) then) =
      __$$LoadingNotesStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingNotesStateImplCopyWithImpl<$Res>
    extends _$NotesStateCopyWithImpl<$Res, _$LoadingNotesStateImpl>
    implements _$$LoadingNotesStateImplCopyWith<$Res> {
  __$$LoadingNotesStateImplCopyWithImpl(_$LoadingNotesStateImpl _value,
      $Res Function(_$LoadingNotesStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingNotesStateImpl implements LoadingNotesState {
  const _$LoadingNotesStateImpl();

  @override
  String toString() {
    return 'NotesState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingNotesStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() noResults,
    required TResult Function(List<NotesModel> data) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? noResults,
    TResult? Function(List<NotesModel> data)? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? noResults,
    TResult Function(List<NotesModel> data)? loaded,
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
    required TResult Function(LoadingNotesState value) loading,
    required TResult Function(NoResultsNotesState value) noResults,
    required TResult Function(LoadedNotesState value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingNotesState value)? loading,
    TResult? Function(NoResultsNotesState value)? noResults,
    TResult? Function(LoadedNotesState value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingNotesState value)? loading,
    TResult Function(NoResultsNotesState value)? noResults,
    TResult Function(LoadedNotesState value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingNotesState implements NotesState {
  const factory LoadingNotesState() = _$LoadingNotesStateImpl;
}

/// @nodoc
abstract class _$$NoResultsNotesStateImplCopyWith<$Res> {
  factory _$$NoResultsNotesStateImplCopyWith(_$NoResultsNotesStateImpl value,
          $Res Function(_$NoResultsNotesStateImpl) then) =
      __$$NoResultsNotesStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoResultsNotesStateImplCopyWithImpl<$Res>
    extends _$NotesStateCopyWithImpl<$Res, _$NoResultsNotesStateImpl>
    implements _$$NoResultsNotesStateImplCopyWith<$Res> {
  __$$NoResultsNotesStateImplCopyWithImpl(_$NoResultsNotesStateImpl _value,
      $Res Function(_$NoResultsNotesStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NoResultsNotesStateImpl implements NoResultsNotesState {
  const _$NoResultsNotesStateImpl();

  @override
  String toString() {
    return 'NotesState.noResults()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoResultsNotesStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() noResults,
    required TResult Function(List<NotesModel> data) loaded,
  }) {
    return noResults();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? noResults,
    TResult? Function(List<NotesModel> data)? loaded,
  }) {
    return noResults?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? noResults,
    TResult Function(List<NotesModel> data)? loaded,
    required TResult orElse(),
  }) {
    if (noResults != null) {
      return noResults();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingNotesState value) loading,
    required TResult Function(NoResultsNotesState value) noResults,
    required TResult Function(LoadedNotesState value) loaded,
  }) {
    return noResults(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingNotesState value)? loading,
    TResult? Function(NoResultsNotesState value)? noResults,
    TResult? Function(LoadedNotesState value)? loaded,
  }) {
    return noResults?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingNotesState value)? loading,
    TResult Function(NoResultsNotesState value)? noResults,
    TResult Function(LoadedNotesState value)? loaded,
    required TResult orElse(),
  }) {
    if (noResults != null) {
      return noResults(this);
    }
    return orElse();
  }
}

abstract class NoResultsNotesState implements NotesState {
  const factory NoResultsNotesState() = _$NoResultsNotesStateImpl;
}

/// @nodoc
abstract class _$$LoadedNotesStateImplCopyWith<$Res> {
  factory _$$LoadedNotesStateImplCopyWith(_$LoadedNotesStateImpl value,
          $Res Function(_$LoadedNotesStateImpl) then) =
      __$$LoadedNotesStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<NotesModel> data});
}

/// @nodoc
class __$$LoadedNotesStateImplCopyWithImpl<$Res>
    extends _$NotesStateCopyWithImpl<$Res, _$LoadedNotesStateImpl>
    implements _$$LoadedNotesStateImplCopyWith<$Res> {
  __$$LoadedNotesStateImplCopyWithImpl(_$LoadedNotesStateImpl _value,
      $Res Function(_$LoadedNotesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$LoadedNotesStateImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<NotesModel>,
    ));
  }
}

/// @nodoc

class _$LoadedNotesStateImpl implements LoadedNotesState {
  const _$LoadedNotesStateImpl({required final List<NotesModel> data})
      : _data = data;

  final List<NotesModel> _data;
  @override
  List<NotesModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'NotesState.loaded(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedNotesStateImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedNotesStateImplCopyWith<_$LoadedNotesStateImpl> get copyWith =>
      __$$LoadedNotesStateImplCopyWithImpl<_$LoadedNotesStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() noResults,
    required TResult Function(List<NotesModel> data) loaded,
  }) {
    return loaded(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? noResults,
    TResult? Function(List<NotesModel> data)? loaded,
  }) {
    return loaded?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? noResults,
    TResult Function(List<NotesModel> data)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingNotesState value) loading,
    required TResult Function(NoResultsNotesState value) noResults,
    required TResult Function(LoadedNotesState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadingNotesState value)? loading,
    TResult? Function(NoResultsNotesState value)? noResults,
    TResult? Function(LoadedNotesState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingNotesState value)? loading,
    TResult Function(NoResultsNotesState value)? noResults,
    TResult Function(LoadedNotesState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class LoadedNotesState implements NotesState {
  const factory LoadedNotesState({required final List<NotesModel> data}) =
      _$LoadedNotesStateImpl;

  List<NotesModel> get data;
  @JsonKey(ignore: true)
  _$$LoadedNotesStateImplCopyWith<_$LoadedNotesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

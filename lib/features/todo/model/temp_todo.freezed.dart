// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'temp_todo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TempTodo {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get deadline => throw _privateConstructorUsedError;
  bool get done => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TempTodoCopyWith<TempTodo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TempTodoCopyWith<$Res> {
  factory $TempTodoCopyWith(TempTodo value, $Res Function(TempTodo) then) =
      _$TempTodoCopyWithImpl<$Res>;
  $Res call({String title, String description, DateTime deadline, bool done});
}

/// @nodoc
class _$TempTodoCopyWithImpl<$Res> implements $TempTodoCopyWith<$Res> {
  _$TempTodoCopyWithImpl(this._value, this._then);

  final TempTodo _value;
  // ignore: unused_field
  final $Res Function(TempTodo) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? deadline = freezed,
    Object? done = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      deadline: deadline == freezed
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
      done: done == freezed
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_TempTodoCopyWith<$Res> implements $TempTodoCopyWith<$Res> {
  factory _$$_TempTodoCopyWith(
          _$_TempTodo value, $Res Function(_$_TempTodo) then) =
      __$$_TempTodoCopyWithImpl<$Res>;
  @override
  $Res call({String title, String description, DateTime deadline, bool done});
}

/// @nodoc
class __$$_TempTodoCopyWithImpl<$Res> extends _$TempTodoCopyWithImpl<$Res>
    implements _$$_TempTodoCopyWith<$Res> {
  __$$_TempTodoCopyWithImpl(
      _$_TempTodo _value, $Res Function(_$_TempTodo) _then)
      : super(_value, (v) => _then(v as _$_TempTodo));

  @override
  _$_TempTodo get _value => super._value as _$_TempTodo;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? deadline = freezed,
    Object? done = freezed,
  }) {
    return _then(_$_TempTodo(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      deadline: deadline == freezed
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
      done: done == freezed
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_TempTodo with DiagnosticableTreeMixin implements _TempTodo {
  const _$_TempTodo(
      {this.title = '',
      this.description = '',
      required this.deadline,
      this.done = false});

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String description;
  @override
  final DateTime deadline;
  @override
  @JsonKey()
  final bool done;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TempTodo(title: $title, description: $description, deadline: $deadline, done: $done)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TempTodo'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('deadline', deadline))
      ..add(DiagnosticsProperty('done', done));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TempTodo &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.deadline, deadline) &&
            const DeepCollectionEquality().equals(other.done, done));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(deadline),
      const DeepCollectionEquality().hash(done));

  @JsonKey(ignore: true)
  @override
  _$$_TempTodoCopyWith<_$_TempTodo> get copyWith =>
      __$$_TempTodoCopyWithImpl<_$_TempTodo>(this, _$identity);
}

abstract class _TempTodo implements TempTodo {
  const factory _TempTodo(
      {final String title,
      final String description,
      required final DateTime deadline,
      final bool done}) = _$_TempTodo;

  @override
  String get title => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  DateTime get deadline => throw _privateConstructorUsedError;
  @override
  bool get done => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TempTodoCopyWith<_$_TempTodo> get copyWith =>
      throw _privateConstructorUsedError;
}

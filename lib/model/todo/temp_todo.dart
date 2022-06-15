// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'temp_todo.freezed.dart';

@freezed
class TempTodo with _$TempTodo {
  const factory TempTodo({
    @Default('') String title,
    @Default('') String description,
    required DateTime deadline,
    @Default(false) bool done,
  }) = _TempTodo;
}

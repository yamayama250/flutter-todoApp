// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app/features/todo/model/database/todo.dart';

part 'todo_state.freezed.dart';

@freezed
class TodoState with _$TodoState {
  const factory TodoState({
    @Default(false) bool isLoading,
    @Default([]) List<Todo> todoItems,
  }) = _TodoState;
}

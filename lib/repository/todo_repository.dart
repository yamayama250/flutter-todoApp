import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:todo_app/model/database/database.dart';
import 'package:todo_app/model/database/todo/todo.dart';

final todoRepositoryProvider =
    Provider((ref) => TodoRepositoryImpl(ref.read(isarProvider)));

abstract class TodoRepository {
  Future<List<Todo>> fetchAll();
  Future<Todo> fetchTodo();
  Future<void> createTodo();
  Future<void> updateTodo();
  Future<void> deleteTodo();
}

class TodoRepositoryImpl implements TodoRepository {
  final Isar _isar;

  TodoRepositoryImpl(this._isar);

  @override
  Future<void> createTodo() {
    // TODO: implement createTodo
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTodo() {
    // TODO: implement deleteTodo
    throw UnimplementedError();
  }

  @override
  Future<List<Todo>> fetchAll() async {
    final todos = await _isar.todos.where().findAll();
    return todos;
  }

  @override
  Future<Todo> fetchTodo() {
    // TODO: implement fetchTodo
    throw UnimplementedError();
  }

  @override
  Future<void> updateTodo() {
    // TODO: implement updateTodo
    throw UnimplementedError();
  }
}

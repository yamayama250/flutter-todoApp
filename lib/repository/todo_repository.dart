import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:todo_app/model/database/database.dart';
import 'package:todo_app/model/database/todo/todo.dart';
import 'package:todo_app/model/todo/temp_todo.dart';

final todoRepositoryProvider =
    Provider((ref) => TodoRepositoryImpl(ref.read(isarProvider)));

abstract class TodoRepository {
  Future<List<Todo>> fetchAll();
  Future<Todo> fetchTodo(int id);
  Future<void> createTodo(TempTodo todo);
  Future<void> updateTodo(TempTodo todo, int id);
  Future<void> deleteTodo(int id);
}

class TodoRepositoryImpl implements TodoRepository {
  final Isar _isar;

  TodoRepositoryImpl(this._isar);

  @override
  Future<void> createTodo(TempTodo todo) async {
    final newTodo = Todo()
      ..title = todo.title
      ..description = todo.description
      ..deadline = todo.deadline
      ..done = todo.done;
    await _isar.writeTxn((isar) => _isar.todos.put(newTodo));
  }

  @override
  Future<void> deleteTodo(int id) async {
    await _isar.writeTxn((isar) async {
      await _isar.todos.delete(id);
    });
  }

  @override
  Future<List<Todo>> fetchAll() async {
    // sortが見当たらないので、怒られてるけどこの方法で並び替え
    final todos = await _isar.todos
        .filter()
        .addSortByInternal("deadline", Sort.asc)
        .buildInternal()
        .findAll();
    return todos;
  }

  @override
  Future<void> updateTodo(TempTodo todo, int id) async {
    final newTodo = Todo()
      ..id = id
      ..title = todo.title
      ..description = todo.description
      ..deadline = todo.deadline
      ..done = todo.done;
    await _isar.writeTxn((isar) => _isar.todos.put(newTodo));
  }

  @override
  Future<Todo> fetchTodo(int id) async {
    final todo = await _isar.todos.get(id);
    return todo!;
  }
}

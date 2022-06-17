import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/features/todo/model/database/todo.dart';
import 'package:todo_app/features/todo/model/temp_todo.dart';
import 'package:todo_app/features/todo/model/todo_state.dart';
import 'package:todo_app/features/todo/repository/todo_repository.dart';
import 'package:todo_app/routing/todo_router_provider.dart';

final todoControllerProvider = StateNotifierProvider<TodoController, TodoState>(
    (ref) => TodoController(ref.read, ref.read(todoRepositoryProvider)));

class TodoController extends StateNotifier<TodoState> {
  final Reader _read;
  final TodoRepositoryImpl _repository;

  TodoController(this._read, this._repository) : super(const TodoState()) {
    getTodos();
  }

  Future<void> getTodos() async {
    state = state.copyWith(isLoading: true);
    final todoItems = await _repository.fetchAll();
    state = state.copyWith(
      isLoading: false,
      todoItems: todoItems,
    );
  }

  Future<Todo> getTodo(int id) async {
    return await _repository.fetchTodo(id);
  }

  Future<void> createTodo(TempTodo todo) async {
    if (todo.title == "") return;
    await _repository.createTodo(todo);
    await getTodos();
    _read(todoRouterProvider).pop();
  }

  Future<void> updateTodo(TempTodo todo, int id) async {
    if (todo.title == "") return;
    await _repository.updateTodo(todo, id);
    await getTodos();
    _read(todoRouterProvider).pop();
  }

  Future<void> checkedTodo(TempTodo todo, int id) async {
    await _repository.updateTodo(todo, id);
    await getTodos();
  }

  Future<void> deleteTodo(int id) async {
    await _repository.deleteTodo(id);
    await getTodos();
    _read(todoRouterProvider).pop();
  }

  List<Todo> getDoneTodos(List<Todo> todos, bool bool) {
    if (bool) {
      return todos
          .where((element) => element.done == bool)
          .toList()
          .reversed
          .toList();
    } else {
      return todos.where((element) => element.done == bool).toList();
    }
  }

  int getIndex(int id, List<Todo> todos) {
    int index = -1;
    todos.asMap().forEach((key, value) {
      if (value.id == id) {
        index = key;
      }
    });
    return index;
  }
}

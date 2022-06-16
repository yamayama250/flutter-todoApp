import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/controller/todo_controller.dart';
import 'package:todo_app/model/database/todo/todo.dart';
import 'package:todo_app/model/todo/temp_todo.dart';
import 'package:todo_app/view/component/date_picker_button.dart';
import 'package:todo_app/view/router_provider.dart';

class ListPage extends ConsumerWidget {
  const ListPage({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.read(routerProvider);
    final controller = ref.read(todoControllerProvider.notifier);
    final pickDate = ref.read(pickDateProvider.notifier);
    final todoState = ref.watch(todoControllerProvider);
    final doneTodos = getDoneTodos(todoState.todoItems, true);
    final notDoneTodos = getDoneTodos(todoState.todoItems, false);
    final dateFormat = DateFormat("yyyy年MM月dd日");

    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.white,
          title: const Text("ToDoリスト"),
          bottom: const TabBar(
            tabs: [
              Tab(child: Text("全部")),
              Tab(child: Text("完了")),
              Tab(child: Text("未完了")),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.separated(
              itemCount: todoState.todoItems.length,
              separatorBuilder: (context, index) => const Divider(height: 0.5),
              itemBuilder: (context, index) => ListTile(
                title: Text(todoState.todoItems[index].title),
                subtitle: Text(
                  "期限：${dateFormat.format(todoState.todoItems[index].deadline)}",
                ),
                trailing: Checkbox(
                  value: todoState.todoItems[index].done,
                  onChanged: (value) {
                    controller.checkedTodo(
                      TempTodo(
                        title: todoState.todoItems[index].title,
                        description: todoState.todoItems[index].description,
                        deadline: todoState.todoItems[index].deadline,
                        done: value!,
                      ),
                      todoState.todoItems[index].id,
                    );
                  },
                ),
                onTap: () {
                  pickDate
                      .update((state) => todoState.todoItems[index].deadline);
                  router.push("/edit/$index");
                },
              ),
            ),
            ListView.separated(
              itemCount: doneTodos.length,
              separatorBuilder: (context, index) => const Divider(height: 0.5),
              itemBuilder: (context, index) => ListTile(
                title: Text(doneTodos[index].title),
                subtitle:
                    Text("期限：${dateFormat.format(doneTodos[index].deadline)}"),
                trailing: Checkbox(
                  value: doneTodos[index].done,
                  onChanged: (value) {
                    controller.checkedTodo(
                      TempTodo(
                        title: doneTodos[index].title,
                        description: doneTodos[index].description,
                        deadline: doneTodos[index].deadline,
                        done: value!,
                      ),
                      doneTodos[index].id,
                    );
                  },
                ),
                onTap: () {
                  pickDate.update((state) => doneTodos[index].deadline);
                  router.push(
                    "/edit/${getIndex(doneTodos[index].id, todoState.todoItems)}",
                  );
                },
              ),
            ),
            ListView.separated(
              itemCount: notDoneTodos.length,
              separatorBuilder: (context, index) => const Divider(height: 0.5),
              itemBuilder: (context, index) => ListTile(
                title: Text(notDoneTodos[index].title),
                subtitle: Text(
                    "期限：${dateFormat.format(notDoneTodos[index].deadline)}"),
                trailing: Checkbox(
                  value: notDoneTodos[index].done,
                  onChanged: (value) {
                    controller.checkedTodo(
                      TempTodo(
                        title: notDoneTodos[index].title,
                        description: notDoneTodos[index].description,
                        deadline: notDoneTodos[index].deadline,
                        done: value!,
                      ),
                      notDoneTodos[index].id,
                    );
                  },
                ),
                onTap: () {
                  pickDate.update((state) => notDoneTodos[index].deadline);
                  router.push(
                    "/edit/${getIndex(notDoneTodos[index].id, todoState.todoItems)}",
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => router.push("/create"),
          icon: const Icon(Icons.menu_open),
          label: const Text("タスクを追加"),
        ),
      ),
    );
  }
}

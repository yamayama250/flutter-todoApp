import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/controller/todo_controller.dart';
import 'package:todo_app/view/component/date_picker_button.dart';
import 'package:todo_app/view/router_provider.dart';

class ListPage extends ConsumerWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.read(routerProvider);
    final controller = ref.read(todoControllerProvider.notifier);
    final todoState = ref.watch(todoControllerProvider);
    final dateFormat = DateFormat("yyyy年MM月dd日");
    const isChecked = false;

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
                  value: isChecked,
                  onChanged: (value) {},
                ),
                onTap: () {
                  ref
                      .read(pickDateProvider.notifier)
                      .update((state) => todoState.todoItems[index].deadline);
                  router.push("/edit/$index");
                },
              ),
            ),
            ListView.separated(
              itemCount: 10,
              separatorBuilder: (context, index) => const Divider(height: 0.5),
              itemBuilder: (context, index) => ListTile(
                title: Text("これはタスクのタイトルです$index"),
                subtitle: Text("これはタスクの期限です$index"),
                trailing: Checkbox(
                  value: isChecked,
                  onChanged: (value) {},
                ),
                onTap: () => router.push("/edit"),
              ),
            ),
            ListView.separated(
              itemCount: 10,
              separatorBuilder: (context, index) => const Divider(height: 0.5),
              itemBuilder: (context, index) => ListTile(
                title: Text("これはタスクのタイトルです$index"),
                subtitle: Text("これはタスクの期限です$index"),
                trailing: Checkbox(
                  value: isChecked,
                  onChanged: (value) {},
                ),
                onTap: () => router.push("/edit"),
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

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/features/todo/controller/todo_controller.dart';
import 'package:todo_app/features/todo/presentation/list/widgets/todo_list.dart';
import 'package:todo_app/routing/todo_router_provider.dart';

class ListPage extends ConsumerWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.read(todoRouterProvider);
    final todoState = ref.watch(todoControllerProvider);

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
        body: listBody(ref, todoState.isLoading),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => router.push("/create"),
          icon: const Icon(Icons.menu_open),
          label: const Text("タスクを追加"),
        ),
      ),
    );
  }
}

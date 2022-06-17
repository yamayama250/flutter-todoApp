import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/features/todo/controller/todo_controller.dart';
import 'package:todo_app/features/todo/model/temp_todo.dart';
import 'package:todo_app/widgets/date_picker_button.dart';
import 'package:todo_app/routing/todo_router_provider.dart';

class CreatePage extends ConsumerWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.read(todoRouterProvider);
    final controller = ref.read(todoControllerProvider.notifier);
    final pickDate = ref.read(pickDateProvider.notifier);
    TempTodo tempTodo = TempTodo(deadline: DateTime.now());

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 110,
        leading: TextButton(
          onPressed: () {
            pickDate.update((state) => DateTime.now());
            router.pop();
          },
          child: const Text(
            "キャンセル",
            style: TextStyle(color: Colors.white),
          ),
        ),
        title: const Text("追加"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                tempTodo = tempTodo.copyWith(
                  deadline: ref.read(pickDateProvider),
                );
                pickDate.update((state) => DateTime.now());
                controller.createTodo(tempTodo);
              },
              icon: const Icon(Icons.done),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "タイトル",
                style: TextStyle(fontSize: 16),
              ),
            ),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                tempTodo = tempTodo.copyWith(title: value);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "詳細",
                style: TextStyle(fontSize: 16),
              ),
            ),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
              onChanged: (value) {
                tempTodo = tempTodo.copyWith(description: value);
              },
            ),
            Align(
              alignment: Alignment.topRight,
              child: datePickerButton(tempTodo.deadline),
            ),
          ],
        ),
      ),
    );
  }
}

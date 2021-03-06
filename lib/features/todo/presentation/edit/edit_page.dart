import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/commom_widgets/date_picker_button.dart';
import 'package:todo_app/commom_widgets/error_snack_bar.dart';
import 'package:todo_app/features/todo/controller/todo_controller.dart';
import 'package:todo_app/features/todo/model/temp_todo.dart';
import 'package:todo_app/features/todo/presentation/edit/widgets/delete_dialog.dart';
import 'package:todo_app/routing/todo_router_provider.dart';

class EditPage extends ConsumerWidget {
  final int id;

  const EditPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.read(todoRouterProvider);
    final controller = ref.read(todoControllerProvider.notifier);
    final todo = ref.read(todoControllerProvider).todoItems[id];
    final pickDate = ref.read(pickDateProvider.notifier);
    TempTodo tempTodo = TempTodo(
      title: todo.title,
      description: todo.description,
      deadline: todo.deadline,
      done: todo.done,
    );

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
        centerTitle: true,
        title: const Text("編集"),
        actions: [
          IconButton(
            onPressed: () => showDeleteDialog(context, ref, todo.id),
            icon: const Icon(Icons.delete),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                if (tempTodo.title == "") {
                  errorSnackBar(context, "タイトルが入力されていません");
                  return;
                }
                tempTodo = tempTodo.copyWith(
                  deadline: ref.read(pickDateProvider),
                );
                controller.updateTodo(tempTodo, todo.id);
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
            TextFormField(
              initialValue: tempTodo.title,
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
            TextFormField(
              initialValue: tempTodo.description,
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

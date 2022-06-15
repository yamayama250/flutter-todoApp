import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/controller/todo_controller.dart';
import 'package:todo_app/model/todo/temp_todo.dart';
import 'package:todo_app/view/router_provider.dart';

final pickDateProvider = StateProvider((ref) => DateTime.now());

class CreatePage extends StatelessWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat("yyyy年MM月dd日");
    TempTodo tempTodo = TempTodo(deadline: DateTime.now());

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 110,
        leading: Consumer(
          builder: (context, ref, child) {
            return TextButton(
              onPressed: () => ref.read(routerProvider).pop(),
              child: const Text(
                "キャンセル",
                style: TextStyle(color: Colors.white),
              ),
            );
          },
        ),
        title: const Text("追加"),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Consumer(
                builder: (context, ref, child) {
                  return IconButton(
                    onPressed: () => ref
                        .read(todoControllerProvider.notifier)
                        .createTodo(tempTodo),
                    icon: const Icon(Icons.done),
                  );
                },
              )),
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
              child: Consumer(
                builder: (context, ref, child) {
                  final pickDate = ref.watch(pickDateProvider);
                  return TextButton(
                    onPressed: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: tempTodo.deadline,
                        firstDate: DateTime(2021),
                        lastDate: DateTime.now().add(const Duration(days: 360)),
                      );
                      if (picked != null) {
                        tempTodo = tempTodo.copyWith(deadline: picked);
                        ref
                            .read(pickDateProvider.notifier)
                            .update((state) => picked);
                      }
                    },
                    child: Text("期限：${dateFormat.format(pickDate)}"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

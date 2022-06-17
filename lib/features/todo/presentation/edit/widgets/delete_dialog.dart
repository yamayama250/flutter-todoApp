import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/features/todo/controller/todo_controller.dart';

Future showDeleteDialog(BuildContext context, WidgetRef ref, int id) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("削除しますか？"),
        content: const Text("タスクを削除することで、二度とタスクを確認できなくなります。"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("キャンセル"),
          ),
          TextButton(
            onPressed: () =>
                ref.read(todoControllerProvider.notifier).deleteTodo(id),
            style: TextButton.styleFrom(
              primary: Colors.red,
            ),
            child: const Text("削除"),
          ),
        ],
      );
    },
  );
}

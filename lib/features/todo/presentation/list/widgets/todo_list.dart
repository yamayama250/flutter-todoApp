import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/commom_widgets/date_picker_button.dart';
import 'package:todo_app/features/todo/controller/todo_controller.dart';
import 'package:todo_app/features/todo/model/temp_todo.dart';
import 'package:todo_app/features/todo/presentation/list/widgets/deadline_text.dart';
import 'package:todo_app/routing/todo_router_provider.dart';

Widget listBody(WidgetRef ref, bool isloading) {
  final router = ref.read(todoRouterProvider);
  final controller = ref.read(todoControllerProvider.notifier);
  final pickDate = ref.read(pickDateProvider.notifier);
  final todoState = ref.watch(todoControllerProvider);
  final doneTodos = controller.getDoneTodos(todoState.todoItems, true);
  final notDoneTodos = controller.getDoneTodos(todoState.todoItems, false);
  final dateFormat = DateFormat("yyyy年MM月dd日");

  if (isloading) {
    return const Center(
      child: Text("loading...wait..."),
    );
  } else {
    return TabBarView(
      children: [
        ListView.separated(
          itemCount: todoState.todoItems.length,
          separatorBuilder: (context, index) => const Divider(height: 0.5),
          itemBuilder: (context, index) => ListTile(
            title: Text(todoState.todoItems[index].title),
            subtitle: deadlineText(todoState.todoItems[index].deadline),
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
              pickDate.update((state) => todoState.todoItems[index].deadline);
              router.push("/edit/$index");
            },
          ),
        ),
        ListView.separated(
          itemCount: doneTodos.length,
          separatorBuilder: (context, index) => const Divider(height: 0.5),
          itemBuilder: (context, index) => ListTile(
            title: Text(doneTodos[index].title),
            subtitle: deadlineText(todoState.todoItems[index].deadline),
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
                "/edit/${controller.getIndex(doneTodos[index].id, todoState.todoItems)}",
              );
            },
          ),
        ),
        ListView.separated(
          itemCount: notDoneTodos.length,
          separatorBuilder: (context, index) => const Divider(height: 0.5),
          itemBuilder: (context, index) => ListTile(
            title: Text(notDoneTodos[index].title),
            subtitle: deadlineText(todoState.todoItems[index].deadline),
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
                "/edit/${controller.getIndex(notDoneTodos[index].id, todoState.todoItems)}",
              );
            },
          ),
        ),
      ],
    );
  }
}

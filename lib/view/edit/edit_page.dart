import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/view/router_provider.dart';

class EditPage extends ConsumerWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.read(routerProvider);

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 110,
        leading: TextButton(
          onPressed: () => router.pop(),
          child: const Text(
            "キャンセル",
            style: TextStyle(color: Colors.white),
          ),
        ),
        centerTitle: true,
        title: const Text("編集"),
        actions: [
          IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.delete),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () => {},
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
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
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
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () => {},
                child: const Text("期限: YYYY年mm月dd日"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

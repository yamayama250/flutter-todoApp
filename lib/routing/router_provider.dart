import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/features/todo/presentation/create/create_page.dart';
import 'package:todo_app/features/todo/presentation/edit/edit_page.dart';
import 'package:todo_app/features/todo/presentation/list/list_page.dart';

final routerProvider = Provider(
  (ref) => GoRouter(
    initialLocation: "/list",
    routes: [
      GoRoute(
        path: "/list",
        builder: (context, state) => const ListPage(),
      ),
      GoRoute(
        path: "/create",
        builder: (context, state) => const CreatePage(),
      ),
      GoRoute(
        path: "/edit/:id",
        builder: (context, state) => EditPage(
          id: int.parse(state.params["id"]!),
        ),
      )
    ],
  ),
);

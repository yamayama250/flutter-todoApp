import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app/model/database/todo/todo.dart';

final isarProvider =
    Provider<Isar>((ref) => throw throw UnimplementedError(""));

Future<Isar> initializeDatabase() async {
  final dir = await getApplicationDocumentsDirectory();

  final isar = await Isar.open(
    schemas: [TodoSchema],
    directory: dir.path,
  );

  return isar;
}

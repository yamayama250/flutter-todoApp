import 'package:isar/isar.dart';

part 'todo.g.dart';

@Collection()
class Todo {
  int id = Isar.autoIncrement;
  late String title;
  late String description;
  late DateTime deadline;
  late bool done;
}

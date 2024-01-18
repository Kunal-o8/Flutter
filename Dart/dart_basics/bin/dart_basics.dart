import 'package:dart_basics/task_management.dart';

void main() async {
  List<Task> tasks = [
    Task('Write Dart Code'),
    Task('Study OOP Concepts'),
    TimedTask('Submit Assignment', DateTime(2024, 2, 1)),
  ];

  await performTaskOperations(tasks);
}

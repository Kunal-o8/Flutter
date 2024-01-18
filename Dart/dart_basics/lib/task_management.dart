import 'dart:async';

class Task {
  String _title;
  bool _isCompleted;

  Task(this._title) : _isCompleted = false;

  String get title => _title;

  bool get isCompleted => _isCompleted;

  void completeTask() {
    _isCompleted = true;
    print('Task "$_title" marked as completed.');
  }
}

class TimedTask extends Task {
  DateTime _deadline;

  TimedTask(String title, this._deadline) : super(title);

  DateTime get deadline => _deadline;

  @override
  void completeTask() {
    super.completeTask();
    print('Deadline for Task "$title" is $_deadline.');
  }
}

Future<void> performTaskOperations(List<Task> tasks) async {
  await Future.forEach(tasks, (Task task) async {
    await Future.delayed(Duration(seconds: 2));
    task.completeTask();
  });

  Map<String, bool> completedTasks = {
    'Write Dart Code': true,
    'Study OOP Concepts': true,
    'Submit Assignment': true,
  };

  print('\nCompleted Tasks:');
  tasks.forEach((Task task) {
    print('${task.title}: ${task.isCompleted ? "Completed" : "Incomplete"}');
  });
  // completedTasks.forEach((title, isCompleted) {
  //   print('$title: ${isCompleted ? "Completed" : "Incomplete"}');
  // });
}

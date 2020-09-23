import 'dart:io';

void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String task2Result = await task2();
  task3(task2Result);
}

void task1() {
  print('task1 complete');
}

Future task2() async {
  String str = 'empty';
  Duration threeSeconds = Duration(seconds: 3);
  //sleep(threeSeconds);
  await Future.delayed(threeSeconds, () {
    str = 'task2 results';
    print('task2 complete');
  });
  return str;
}

void task3(task2Result) {
  print('task3 complete, results: $task2Result');
}

///////////////////////////////

// import 'dart:io';
//
// void main() {
//   performTasks();
// }
//
// void performTasks() {
//   task1();
//   task2();
//   task3();
// }
//
// void task1() {
//   print('task1 complete');
// }
//
// void task2() {
//   Duration threeSeconds = Duration(seconds: 3);
//   //sleep(threeSeconds);
//   Future.delayed(threeSeconds, () {
//     print('task2 complete');
//   });
// }
//
// void task3() {
//   print('task3 complete');
// }

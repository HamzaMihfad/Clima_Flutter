import 'dart:io';

void main() {
  performTasks();
}

void performTasks() {
  task1();
  task2();
  task3();
}

void task1() {
  print('task1 complete');
}

void task2() {
  Duration threeSeconds = Duration(seconds: 3);
  //sleep(threeSeconds);
  Future.delayed(threeSeconds, () {
    print('task2 complete');
  });
}

void task3() {
  print('task3 complete');
}

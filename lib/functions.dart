import 'package:todo_app/task.dart';
import 'task_list.dart';
import 'package:flutter/material.dart';

void taskRemove(int index){
  taskList.removeAt(index);
  debugPrint(taskList.length.toString());
}

void taskadd(Task newTask){
  taskList.add(newTask);
  debugPrint(taskList.length.toString());
}
 
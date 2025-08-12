import 'package:flutter/material.dart';
import 'package:todo_app/functions.dart';
import 'package:todo_app/taskadd.dart';
import 'task_list.dart';
import 'taskcard.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      appBar: AppBar(
        title: Text(
          'To-do Tracker',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: const Color.fromARGB(200, 0, 0, 0),
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Center(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    backgroundColor: Theme.of(
                      context,
                    ).colorScheme.secondaryFixed,
                    context: context,
                    builder: (context) {
                      return Taskadd(
                        onSubmit: () {
                          setState(() {});
                        },
                      );
                    },
                    isScrollControlled: true,
                  );
                },
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.fromLTRB(40, 40, 40, 20),
                  color: const Color.fromARGB(255, 0, 38, 68),
                  child: Column(
                    children: [
                      Icon(
                        Icons.add,
                        size: 40,
                        color: const Color.fromARGB(130, 255, 255, 255),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        'Tap "+" icon to add a task',
                        style: TextStyle(
                          fontSize: 21,
                          color: const Color.fromARGB(200, 255, 255, 255),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsGeometry.fromLTRB(10, 10, 40, 10),
                child: Text(
                  'Tasks',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Flexible(
                child: ListView.builder(
                  itemCount: taskList.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      background: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red,
                        ),
                        padding: EdgeInsets.only(left: 40),
                        alignment: Alignment.centerLeft,
                        child: Icon(Icons.delete_outline_rounded),
                      ),
                      secondaryBackground: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red,
                        ),
                        padding: EdgeInsets.only(right: 40),
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.delete_outline_rounded),
                      ),
                      key: ValueKey(taskList[index].id),
                      onDismissed: (direction) {
                        final removedTask = taskList[index];

                        setState(() {
                          taskRemove(index);
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.only(bottom: 30),
                            content: Text("Task deleted"),
                            action: SnackBarAction(
                              label: "Undo",
                              onPressed: () {
                                setState(() {
                                  taskList.insert(index, removedTask);
                                });
                              },
                            ),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      },
                      child: Taskcard(
                        data: taskList[index],
                        remove: () {
                          final removedTask = taskList[index];
                          setState(() {
                            taskRemove(index);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                behavior: SnackBarBehavior.floating,
                                margin: EdgeInsets.only(bottom: 30),
                                content: Text("Task deleted"),
                                action: SnackBarAction(
                                  label: "Undo",
                                  onPressed: () {
                                    setState(() {
                                      taskList.insert(index, removedTask);
                                    });
                                  },
                                ),
                                duration: Duration(seconds: 3),
                              ),
                            );
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

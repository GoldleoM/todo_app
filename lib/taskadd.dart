import 'package:flutter/material.dart';
import 'package:todo_app/functions.dart';
import 'package:todo_app/task.dart';

class Taskadd extends StatefulWidget {
  const Taskadd({super.key, required this.onSubmit});
  final Function onSubmit;
  @override
  State<Taskadd> createState() => _TaskaddState();
}

class _TaskaddState extends State<Taskadd> {
  final tc = TextEditingController();

  @override
  void dispose() {
    tc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.only(left: 10, top: 40, bottom: 20),
      child: Column(
        children: [
          Text('Enter Your Task', style: TextStyle(fontSize: 18)),
          const SizedBox(height: 20),
          TextField(
            autofocus: true,
            controller: tc,
            decoration: InputDecoration(hintText: 'Type Here...'),
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(const Color.fromARGB(255, 3, 42, 111)),
                  padding: WidgetStateProperty.all(EdgeInsets.all(8)),
                ),
                onPressed: () {
                  setState(() {
                    if (tc.text.isNotEmpty) {
                      taskadd(Task(title: tc.text));
                      widget.onSubmit();
                      debugPrint(tc.text);
                      tc.clear();
                      Navigator.of(context).pop();
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Error'),
                            content: Text(
                              'Please enter a task before submitting.',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(
                                    context,
                                  ).pop(); // Close the dialog
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  });
                },
                child: Text(
                  'Submit',
                  style: TextStyle(
                    color: const Color.fromARGB(220, 255, 255, 255),
                  ),
                  ),
              ),
              const SizedBox(width: 10,),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

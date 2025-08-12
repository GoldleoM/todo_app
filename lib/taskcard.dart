import 'package:flutter/material.dart';
import 'package:todo_app/task.dart';

class Taskcard extends StatefulWidget {
    const Taskcard({
    super.key,
    required this.data,
    required this.remove,
   });
   final Task data;
   final Function remove;

  @override
  State<Taskcard> createState() => _TaskcardState();
}

class _TaskcardState extends State<Taskcard> {
   bool isChecked = false;
  @override
  Widget build(BuildContext context) {
     return Card(
        child: ListTile(
          leading: Checkbox(value: isChecked, onChanged: (value){
            debugPrint('TAP');
            setState(() {
              isChecked = value!;
            });
          },
          activeColor: Colors.green,
          ),
          title: Text(widget.data.title),
          trailing: IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.red,
              ),
              onPressed: (){
                widget.remove();
              },
          ),
        ),
      );
  }
}
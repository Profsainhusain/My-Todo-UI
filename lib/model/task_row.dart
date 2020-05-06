import 'package:flutter/material.dart';
import 'package:ui_demo/model/task_data_model.dart';

class TaskRow extends StatefulWidget {
  final Task task;
  final double dotSize = 12.0;

  TaskRow({this.task});

  @override
  _TaskRowState createState() => _TaskRowState();
}

class _TaskRowState extends State<TaskRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0 - widget.dotSize / 2),
            child: Container(
              height: widget.dotSize,
              width: widget.dotSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.task.color,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.task.todo,
                  style: TextStyle(fontSize: 18.0),
                ),
                Text(
                  widget.task.category,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text(
              widget.task.time,
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}



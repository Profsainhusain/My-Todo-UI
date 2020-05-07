
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Task{
  final String todo;
  final String category;
  final String time;
  final Color color;
  final bool completed;

  Task({this.todo, this.category, this.time, this.color, this.completed});
}

//Task List
List<Task> tasks = [
  Task(
    todo: 'Call Project Director',
    category: 'Mobile Project',
    time: '10am',
    color: Colors.orange,
    completed: false,
  ),
  Task(
    todo: 'Make new Icons',
    category: 'Mobile Project',
    time: '11am',
    color: Colors.cyan,
    completed: true,
  ),
  Task(
    todo: 'Design explorations',
    category: 'Company Website',
    time: '12pm',
    color: Colors.pink,
    completed: true,
  ),
  Task(
    todo: 'Lunch with Habibi',
    category: 'Mr. Bigs',
    time: '1pm',
    color: Colors.cyan,
    completed: true,
  ),
  Task(
    todo: 'Team Meeting',
    category: 'Hangouts',
    time: '3pm',
    color: Colors.amber,
    completed: true,
  ),
  Task(
    todo: 'Salatu Asr',
    category: 'Time to Worship',
    time: '4pm',
    color: Colors.greenAccent,
    completed: false,
  ),
  Task(
    todo: 'Coding challenges',
    category: 'Self Development',
    time: '5pm',
    color: Colors.orange,
    completed: false,
  ),
];


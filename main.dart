import 'package:todo/todo.dart';
import 'package:flutter/material.dart';
import 'package:todo/tasksOfTodolist.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My ToDoList',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: todo(),
    );
}
}
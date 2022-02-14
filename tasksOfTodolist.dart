import 'package:flutter/material.dart';
class MyTask extends StatelessWidget {
  String title;
  String description;
  bool done;
  String date;

  MyTask({Key key,this.title,this.description,this.date,this.done}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: done?Colors.teal : Colors.white,
      child: ListTile(
        title: Text(title),
        subtitle: Text(description),
         trailing: done? Icon(Icons.done,color: Colors.black,) : Icon(Icons.clear,color: Colors.black,),

      ),
    );
  }
}
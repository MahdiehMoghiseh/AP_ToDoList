import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/tasksOfTodolist.dart';
class todo extends StatefulWidget {
  @override
  _todoState createState() => _todoState();
}

class _todoState extends State<todo> {
  TextEditingController titleController;
  TextEditingController descriptionController;
  TextEditingController dateController;
  List<MyTask> MyTodoList = <MyTask>[];

  @override
  void initState() {
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    dateController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    dateController.dispose();
    super.dispose();
  }

  void addTask(String title,String description,String date){
    setState(() {
     MyTodoList.add(MyTask(
       title:title,
       description:description,
       date: date,
       done: false,
     ));
    });
  }



  void ShowAdd(context) {
    Navigator.of(context).push(
        new MaterialPageRoute(
            builder: (context) {
              return Padding(padding: EdgeInsets.all(16),
                child: new Scaffold(
                    appBar: new AppBar(
                        title: new Text('Add a new task')
                    ),
                    body: Column(
                      children: [
                        new TextField(
                          controller: titleController,
                          decoration: new InputDecoration(labelText: 'title'),

                        ),
                        new TextField(
                          controller: descriptionController,
                          decoration: new InputDecoration(labelText: 'description'),
                        ),
                        new TextField(
                          controller: dateController,
                          decoration: new InputDecoration(labelText: 'deadline'),
                        ),
                  ElevatedButton(onPressed: (){
                    addTask(titleController.text,descriptionController.text,dateController.text);
                    titleController.clear();
                    descriptionController.clear();
                    dateController.clear();
                    Navigator.pop(context);
                  },
                    child: Text('add task')),
                      ],
                    ),
                ),
              );
            }
            )
    );
  }
  void ShowTask(context,MyTask MyTask){
    bool isSwitched = MyTask.done;
    Navigator.of(context).push(
      new MaterialPageRoute(
          builder: (context){
            return new Scaffold(
              appBar: new AppBar(
                title: new Text(MyTask.title),
              ),
              body: Column(
                children: [
                  new Card(
                    child: ListTile(
                      title: Text('description',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      subtitle: Text(
                        MyTask.description,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  new Card(
                    child: ListTile(
                      title: Text('deadline',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      subtitle: Text(
                        MyTask.date,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Done : '
                    ),
                  ),
                  Center(
                    child: Switch(
                      value: isSwitched,
                      onChanged: (value){
                        setState(() {
                          isSwitched=value;
                        });
                      },
                      activeTrackColor: Colors.pink,
                      activeColor: Colors.black,
                    ),
                  ),
                  ElevatedButton(onPressed: (){
                    MyTask.done = true;
                    descriptionController.clear();
                    dateController.clear();
                    Navigator.pop(context);
                  },
                    child: Text('DONE'),
                  ),
                ],
              ),
            );
          }
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'My todoList'
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          ShowAdd(context);
        },
      ),
      body: ListView.builder(
        itemCount: MyTodoList.length,
          itemBuilder: (context,int index) {
          return GestureDetector(
            onTap: (){
              ShowTask(context, MyTodoList[index]);
            },
            child: MyTodoList[index],
          );
      },

      ),
    );
  }
}
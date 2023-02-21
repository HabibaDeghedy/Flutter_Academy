import 'package:flutter/material.dart';
import 'package:todoapp/service/todo_api.dart';
import 'repositories/todo.dart';

class apiScreen extends StatefulWidget {
  @override
  State<apiScreen> createState() => _apiScreenState();
}

class _apiScreenState extends State<apiScreen> {
  late List<TodoModel>? todos =[];

  void initState(){
      super.initState();
      getData();
  }
  void getData() async{
    todos = (await TodoRepository().getTodos())!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orange,
        elevation: 4,
        title: Text('My Todos'),
      ),
      body: todos!.isEmpty?
            const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
            itemCount: todos!.length,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.orange[100],
                child: Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: Text(
                          todos![index].title.toString(),
                        ),
                      ),
                    ),
                    Checkbox(

                      activeColor: Colors.orange[400],
                      value: todos![index].completed,
                      onChanged: (checkBoxValue){
                        setState(() {
                          todos![index].completed = checkBoxValue;
                        });
                        print(checkBoxValue);
                      },
                    ),
                  ],
                ),
              );
            }
      ),
    ) ;
  }
}

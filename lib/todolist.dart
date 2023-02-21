import 'package:flutter/material.dart';
import 'package:todoapp/dbhelper.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(builder: (context,snap){
      if (snap.hasData == null){
          return Center(child: Text('No Data'),);
      }else{
        if (myTodos.length == 0){
          return Scaffold(appBar: AppBar(
            title: Center(child: Text('My Tasks')),
            backgroundColor: Colors.orange,
          ),
            floatingActionButton: FloatingActionButton(
              onPressed: showAlertDialog,
              child: Icon(Icons.add),
              backgroundColor: Colors.orange,

            ),
            body: Center(
              child: Text(
                'No Tasks Available',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.grey,
                ),
              ),
      ),
          );
        } else{
          return Scaffold(appBar: AppBar(
            title: Center(child: Text('My Tasks')),
            backgroundColor: Colors.orange,
          ),
            floatingActionButton: FloatingActionButton(
              onPressed: showAlertDialog,
              child: Icon(Icons.add),
              backgroundColor: Colors.orange,

            ),
            body: SingleChildScrollView(
              child: Column(
                children: cards,
              ),
            ),
          );
        }
      }
    },future: query(),);
  }

  void showAlertDialog(){
    todoController.text='';
    errorMessage= '';
    showDialog(
        context: context,
        builder: (context){
          return StatefulBuilder(builder: (context, setState){
            return AlertDialog(
              backgroundColor: Colors.orangeAccent[200],
            title: Text('Add New Task'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    clipBehavior: Clip.hardEdge,
                  autocorrect: true,
                    autofocus: true,
                    controller: todoController,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                      errorText: validated ? null : errorMessage,
                    ),
                    onChanged: (value){
                      todoAdded = value;
                    },
                  ),
                  Padding(padding: EdgeInsets.only(top: 10.0),),
                  MaterialButton(
                    color: Colors.orange,
                      child: Text('Add', style: TextStyle(
                          fontSize: 18,
                        fontWeight:FontWeight.bold,
                        color: Colors.white,
                      ),
                      ),
                      onPressed: (){
                      if (todoController.text.isEmpty){
                        setState((){
                          errorMessage = 'Can Not Be Empty';
                          validated = false;
                        });
                      } else if(todoController.text.length > 100){
                        setState ((){
                          errorMessage = 'Too Many Characters';
                          validated = false;
                        });
                      } else{
                          addTodo();
                      }
                      }
                  ),
                ],
              ),
            );
          });
        });
  }

  void addTodo() async{
      Map<String,dynamic> todo = {
      DatabaseHelper.columnName: todoAdded,
      };
      await dbHelper.insert(todo);
      Navigator.of(context, rootNavigator: true).pop();
      todoAdded = '';
      setState(() {
        validated = true;
        errorMessage = '';
      });
  }

  Future<bool> query() async{
    myTodos = [];
    cards = [];
    var listOfAllTodos = await dbHelper.queryAllTodos();
    listOfAllTodos?.forEach((element) {
      myTodos.add(element.toString());
      cards.add(
        Card(
          elevation: 5.0,
        color: Colors.orange[100],
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Container(
          padding: EdgeInsets.all(5.0),
           child: ListTile(
             title: Row(
               children: [
                 Text(element['todo'], style: TextStyle(
                   fontSize: 18,
                 ),),
               ],
             ),
             onLongPress: (){
               dbHelper.updateTodo(element);
               print('Task Has Been Updated');
               setState(() {
               });
             },
             trailing: IconButton(
               onPressed: (){
                 dbHelper.deleteTodo(element['id']);
                 print('Task Has Been Deleted');
                 setState(() {

                 });
               },
               icon: Icon(Icons.delete, color: Colors.orange,),
             ),
           ),

        ),
      ),);
    });
    return Future.value(true);
  }

  final todoController = TextEditingController();
  bool validated = true;
  String errorMessage = '';
  String todoAdded = '';
  String todoEdited = '';
  var myTodos = [];
  List<Widget> cards = [];
  final dbHelper = DatabaseHelper.instance;
  
}






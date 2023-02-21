import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../constants/constants.dart';
import '../service/todo_api.dart';

class TodoRepository {

  Future<List<TodoModel>?> getTodos() async{
    List<TodoModel> todoAppList = [];


    try {
      Response response = await get(Uri.parse('${ApiConstants.baseUrl}${ApiConstants.todoEndpoint}'));
      List jsonList = jsonDecode(response.body);

      for(int i=0; i<jsonList.length; i++){
        todoAppList.add(TodoModel.fromJson(jsonList[i]));
      }

    }
    catch(e){
      debugPrint('Caught Error; $e');
    }

    return todoAppList;
  }


}

import 'package:flutter/material.dart';

import '../models/todo_models.dart';
import '../services/todo_services.dart';

class TodoProvider extends ChangeNotifier{
  final TodoServices _services=TodoServices();
  bool isLoading=false;
  List <Todo> _todos=[];
  List<Todo> get todos=>_todos;
  Future<void> getAllTodo()async{
     isLoading=true;
    notifyListeners();
  final responce=  await _services.getAll();
  _todos=responce;
      isLoading=false;
      notifyListeners();



  }
}
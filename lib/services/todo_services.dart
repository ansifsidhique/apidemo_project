import 'dart:convert';

import 'package:http/http.dart';
import 'package:userprofile/models/todo_models.dart';

class TodoServices{
  Future<List<Todo>> getAll()async{
   const url="";
   final uri=Uri.parse(url);
   Response response=await get(uri);
   if(response.statusCode==200){
     final json=jsonDecode(response.body)as List;
     final todos=json.map((e) {
       return Todo(id: e["id"], userId: e["userId"], title: e["title"], body: e["title"]);
     }).toList();
     return todos;

   }
   return [];

  }
}
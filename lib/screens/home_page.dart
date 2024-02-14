import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<TodoProvider>(context, listen: false).getAllTodo();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:const Text("todo"),
      ),
      body: Consumer<TodoProvider>(
         builder: (context, value, child) {
           if(value.isLoading){
             return  const Center(child: CircularProgressIndicator(),);
           }
           final todos=value.todos;

           return ListView.builder(
             itemCount: todos.length,
             itemBuilder: (context, index) {
             final todo=todos[index];
            return ListTile(
              title: Text(todo.title),
            ) ;
           },);
         },
         ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:todo_app/add_todo.dart';
import 'package:todo_app/provider/todo_provider.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key,}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  void initState() {
    Provider.of<Todo>(context, listen:false).getTodos();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<Todo>(
        builder: (context, model, _) {
          return FutureBuilder(
              future: model.getTodos(),
              builder: (context, snapshot) {
                return ListView.builder(
                  itemCount: model.todoData.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(model.todoData[index]['title']),
                      subtitle: Text(model.todoData[index]['description']),
                    );
                  },
                );
              });
        },
      ),

floatingActionButton: FloatingActionButton(
  onPressed: ()=>addTodo(context),
  child: const Icon(Icons.add),
),
    );
  }
}

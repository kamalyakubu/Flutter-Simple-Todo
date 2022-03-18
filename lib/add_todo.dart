import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_app/provider/todo_provider.dart';

   final TextEditingController titleController = TextEditingController();
 final TextEditingController descriptionController = TextEditingController();

addTodo(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 500,
          width: 500,
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(hintText: 'Title'),
              ),

              const SizedBox(
                height: 10,
              ),

              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(hintText: 'Description'),
              ),

              const SizedBox(
                height: 10,
              ), //

              ElevatedButton(
                  onPressed: () {
                    if (titleController.text.isNotEmpty &&
                        descriptionController.text.isNotEmpty) {
                      Provider.of<Todo>(context, listen: false).postTodo({
                        "title": titleController.text,
                        "description": descriptionController.text
                      });
                    } else{
                      return ;
                    }

                    Navigator.pop(context);
                  },
                  
                  child: const Text('Submit')),
            ],
          ),
        );
      });
}

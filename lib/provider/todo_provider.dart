import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Todo extends ChangeNotifier {
  final httpClient = http.Client();

  List<dynamic> todoData;
  Todo({
    required this.todoData,
  });

  //Headers
  Map<String, String> todoHeaders = {
    "Accept": "application/json", 
    "Content-Type": "application/json"
  };

  final baseUrl = 'https://insect-loan.cyclic-app.com';

//Get all Todos
  Future getTodos() async {
    final Uri uri = Uri.parse('$baseUrl/todos');

    http.Response response = await httpClient.get(uri);

    final Map body = await json.decode(
      response.body.toString(),
    );

    todoData = body['data'];
    print(todoData);
  }

  //Post a Todo
  Future postTodo(Map<String, String> body) async {
    final Uri uri = Uri.parse('$baseUrl/todo');
    http.Response response = await httpClient.post(
      uri,
      headers: todoHeaders,
      body: jsonEncode(body),
    );

    return response.body;
  }


}



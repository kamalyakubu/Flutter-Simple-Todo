import 'package:flutter/material.dart';
import 'package:todo_app/homeview.dart';
import 'package:device_preview/device_preview.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todo_provider.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => const MyApp(),
    ),

   //const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: MaterialApp(
      locale: DevicePreview.locale(context),
      useInheritedMediaQuery: true,
      title: 'Todo Application',
     
      home: const HomeView(),
    ),

    providers: [ChangeNotifierProvider(
      create: (_)=>Todo(todoData: []),
    )],
    );
  }
}

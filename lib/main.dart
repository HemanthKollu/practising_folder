import 'package:flutter/material.dart';
import 'package:practising_folder/my_home_page/api_calls_folder/api_ui.dart';
import 'package:practising_folder/my_home_page/category_card/category_ui.dart';
import 'package:practising_folder/my_home_page/tabs/tabs_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practising Folder',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), useMaterial3: true),
      home: CategoryUi(),
      debugShowCheckedModeBanner: false,
    );
  }
}


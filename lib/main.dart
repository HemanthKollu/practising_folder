import 'package:flutter/material.dart';
import 'package:practising_folder/my_home_page/category_card/category_ui.dart';
// import 'package:practising_folder/my_home_page/gantt_chart/gantt_chart_ui.dart';
// import 'package:practising_folder/my_home_page/support_ticket/support_ticket_ui.dart';
import 'package:practising_folder/my_home_page/tabs/tabs_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practising Page',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), useMaterial3: true),
      home: CategoryUi(),
      debugShowCheckedModeBanner: false,
    );
  }
}


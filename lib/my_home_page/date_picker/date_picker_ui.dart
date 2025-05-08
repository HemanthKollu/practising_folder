import 'dart:async';

import 'package:flutter/material.dart';

class DatePickerUi extends StatefulWidget {
  const DatePickerUi({super.key});

  @override
  State<DatePickerUi> createState() => _DatePickerUiState();
}

class _DatePickerUiState extends State<DatePickerUi> {
  DateTime _selectedDate = DateTime.now();

  late String _currentTime;
  
  // ignore: unused_field
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _currentTime = _formatTime(DateTime.now());

    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        _currentTime = _formatTime(DateTime.now());
      });
    });
  }

  String _formatTime(DateTime time) {
    return "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:${time.second.toString().padLeft(2, '0')}";
  }

@override
  void dispose() {
    _timer.cancel(); 
    super.dispose();
  }

  

  Future<void> _pickeDate(BuildContext context) async{
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate, 
      firstDate: DateTime(2000), 
      lastDate: DateTime(2026, 12, 31),);

      if(picked != null && picked != _selectedDate){
        setState(() {
          _selectedDate = picked;
        });
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text('Selected Date: ${_selectedDate.toLocal().toString().split(' ')[0]}',  style: TextStyle(fontSize: 24),),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            _pickeDate(context);
          }, child: Text('Show Date',)),
          SizedBox(height: 20,),
          Text(
          _currentTime,
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),)
        ],),
      ),
    );
  }
}
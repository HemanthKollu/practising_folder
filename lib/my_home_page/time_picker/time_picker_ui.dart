import 'package:flutter/material.dart';

class TimePickerUi extends StatefulWidget {
  const TimePickerUi({super.key});

  @override
  State<TimePickerUi> createState() => _TimePickerUiState();
}

class _TimePickerUiState extends State<TimePickerUi> {
  TimeOfDay _selectedTime = TimeOfDay(hour: 12, minute: 0);

  Future<void> _selectTime(BuildContext context)async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context, 
      initialTime: _selectedTime);

      if(pickedTime != null && pickedTime != _selectedTime){
        setState(() {
          _selectedTime = pickedTime;
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
          Text(' Selected Time: ${_selectedTime.format(context)} ', style: TextStyle(fontSize: 24),),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            _selectTime(context);
          }, child: Text('Time Picker'))
        ],),
      ),
    );
  }
}
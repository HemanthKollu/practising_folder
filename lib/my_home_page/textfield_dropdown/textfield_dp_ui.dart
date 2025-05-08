import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practising_folder/my_home_page/textField_dropdown/textField_dp_model.dart';
import 'package:practising_folder/my_home_page/textField_dropdown/textfield_dp_service.dart';

class TextFieldDropdown extends StatefulWidget {
  const TextFieldDropdown({super.key});

  @override
  State<TextFieldDropdown> createState() => _TextFieldDropdownState();
}

class _TextFieldDropdownState extends State<TextFieldDropdown> {
  final TextEditingController _myController = TextEditingController();
  final TimeUnitService _service = TimeUnitService();

  TimeUnitModel? selectedUnit;
  String _enteredNum = '';
  String _submittedText = '';
  List<TimeUnitModel> timeUnits = [];

  @override
  void initState() {
    super.initState();
    timeUnits = _service.getTimeUnits();
  }

  getSelectedUnit() {
    if (_enteredNum.isNotEmpty && selectedUnit != null) {
      setState(() {
        _submittedText = '$_enteredNum ${selectedUnit?.label ?? ''}';
        _myController.clear();
        _enteredNum = '';
        selectedUnit = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 500,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    child: TextField(
                      controller: _myController,
                      maxLength: 5,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'Type here...', counterText: ''),
                      onChanged: (value) {
                        setState(() {
                          _enteredNum = value.toString();
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  // Dropdown
                  SizedBox(
                    width: 150,
                    child: DropdownButtonFormField(
                      value: selectedUnit,
                      items:
                          timeUnits.map((unit) {
                            return DropdownMenuItem(value: unit, child: Text(unit.label));
                          }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedUnit = value;
                        });
                      },
                      decoration: const InputDecoration(hintText: "Select Unit", border: OutlineInputBorder()),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(onPressed: getSelectedUnit, child: Text('Click Here')),
                ],
              ),
              SizedBox(height: 20),
              Text('Selected Unit: $_submittedText', style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}

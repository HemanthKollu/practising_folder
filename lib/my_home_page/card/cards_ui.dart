import 'package:flutter/material.dart';

class CardUi extends StatefulWidget {
  const CardUi({super.key});

  @override
  State<CardUi> createState() => _CardUiState();
}

class _CardUiState extends State<CardUi> {
  final TextEditingController _myController = TextEditingController();
  String _enterText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 400,
          width: 500,
          child: Card(
            color: Colors.white,
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Align(
                child: SizedBox(
                  height: 350,
                  width: 450,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Card Section', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500), textAlign: TextAlign.center),
                      TextField(
                        controller: _myController,
                        onChanged: ((text) {
                          
                        }),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.black, width: 2)),
                          label: Text('Field Label'),
                          hintText: 'Enter here',
                        ),
                      ),
                      SizedBox(height: 10),
                      Align(alignment: Alignment.centerLeft, child: Text('Entered Text: $_enterText')),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              _enterText = _myController.text;
                            });
                          },
                          child: const Icon(Icons.add),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

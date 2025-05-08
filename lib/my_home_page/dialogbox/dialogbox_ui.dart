import 'package:flutter/material.dart';

class DialogboxUi extends StatefulWidget {
  const DialogboxUi({super.key});

  @override
  State<DialogboxUi> createState() => _DialogboxUiState();
}

class _DialogboxUiState extends State<DialogboxUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 300,
          child: Column(
            children: [
              Tooltip(
                message: 'Click here to display dialog box',
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder:
                          (context) => AlertDialog(
                            title: Text('Dialog Box'),
                            content: Text('This is simple Dialog box example'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Ok'),
                              ),
                            ],
                          ),
                    );
                  },
                  child: Text('Click here'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

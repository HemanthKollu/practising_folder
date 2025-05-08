import 'package:flutter/material.dart';

class SnackbarUi extends StatefulWidget {
  const SnackbarUi({super.key});

  @override
  State<SnackbarUi> createState() => _SnackbarUiState();
}

class _SnackbarUiState extends State<SnackbarUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          SizedBox(height: 50),
          Center(
            child: ElevatedButton(
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Save Successfully'),
                    duration: const Duration(seconds: 2),
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 500),
                    action: SnackBarAction(
                      label: 'UNDO', 
                      onPressed: (){
                        
                    }),
                    )
                );
              }, 
              child: Text("show snackbar")),
          )
        ]),
      ));
  }
}

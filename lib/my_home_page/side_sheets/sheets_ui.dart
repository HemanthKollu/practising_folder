import 'package:flutter/material.dart';
import 'package:practising_folder/my_home_page/side_sheets/sheets_model.dart';
import 'package:practising_folder/my_home_page/side_sheets/sheets_service.dart';

class SheetsUi extends StatefulWidget {
  const SheetsUi({super.key});

  @override
  State<SheetsUi> createState() => _SheetsUiState();
}

class _SheetsUiState extends State<SheetsUi> {
  final SheetsService _service = SheetsService();

  List<SheetsModel> menuList = [];

  @override
  void initState(){
    super.initState();
    menuList = _service.getMenus();
  }

  void _showSideSheet(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: true, 
      builder: (context){
        return Align(
          alignment: Alignment.centerRight,
          child: Material(
            elevation: 8,
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(16), bottomLeft: Radius.circular(16)),
            child: Container(
              width: 300,
              height: double.infinity,
              padding: EdgeInsets.all(16),
              child: Column(children: [
                Text('Side Sheet'),
                Divider(),
                Expanded(
                  child: ListView.builder(
                    itemCount: menuList.length,
                    itemBuilder: (context, index) {
                      final menu = menuList[index];
                      return ListTile(
                        title: Text(menu.menu), 
                        onTap: () {},
                      );
                    },
                  ),
                ),
                Spacer(),
                ElevatedButton(onPressed: (){
                  Navigator.of(context).maybePop();
                }, child: Text('Cancel'))
              ],),
            ),
          ),
        );
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
          IconButton(
            onPressed: (){
              _showSideSheet(context);
            }, 
            icon: Icon(Icons.menu, size: 35,),)
        ],),
      )
    );
  }
}
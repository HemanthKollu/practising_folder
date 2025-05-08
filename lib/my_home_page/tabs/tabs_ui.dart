import 'package:flutter/material.dart';
import 'package:practising_folder/my_home_page/card/cards_ui.dart';
import 'package:practising_folder/my_home_page/date_picker/date_picker_ui.dart';
import 'package:practising_folder/my_home_page/dialogbox/dialogbox_ui.dart';
import 'package:practising_folder/my_home_page/navigation_bar/navigation_bar_ui.dart';
import 'package:practising_folder/my_home_page/searchBar/search_bar_ui.dart';
import 'package:practising_folder/my_home_page/side_sheets/sheets_ui.dart';
import 'package:practising_folder/my_home_page/snackbar/snackbar_ui.dart';
import 'package:practising_folder/my_home_page/tabs/tabs_service.dart';
import 'package:practising_folder/my_home_page/textField_dropdown/textField_dp_ui.dart';
import 'package:practising_folder/my_home_page/time_picker/time_picker_ui.dart';
// import 'package:practising_folder/my_home_page/styled_textfield/styled_textfield_ui.dart';
import 'tabs_model.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  TabsService tabService = TabsService();
  List<TabItemModel> tabItem = [];

  @override
  void initState() {
    super.initState();
    tabItem = tabService.getTabItems();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabItem.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs:
                tabItem.map((tab) {
                  return Tab(icon: Icon(tab.icon), text: tab.text);
                }).toList(),
          ),
        ),
        body: TabBarView(children: [SearchBarUi(), TextFieldDropdown(), CardUi(), NavigationBarExample(), SnackbarUi(), DialogboxUi(), SheetsUi(), TimePickerUi(), DatePickerUi(),]),
      ),
    );
  }
}

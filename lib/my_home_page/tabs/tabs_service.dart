import 'package:flutter/material.dart';
import 'package:practising_folder/my_home_page/tabs/tabs_model.dart';

class TabsService {
  List<TabItemModel> getTabItems() {
    return [
      TabItemModel(icon: Icons.search, text: 'Search'),
      TabItemModel(icon: Icons.star, text: 'TextFieldDropdown'),
      TabItemModel(icon: Icons.card_travel_sharp, text: 'Card'),
      TabItemModel(icon: Icons.navigation, text: 'NavigationRail'),
      TabItemModel(icon: Icons.message, text: 'SnackBar'),
      TabItemModel(icon: Icons.add_box, text: 'DialogBox'),
      TabItemModel(icon: Icons.menu, text: 'SideSheet'),
      TabItemModel(icon: Icons.access_time_filled, text: 'TimerPicker'),
      TabItemModel(icon: Icons.date_range, text: 'DatePicker'),
      TabItemModel(icon: Icons.library_books_outlined, text: 'Clipboard'),
    ];
  }
}

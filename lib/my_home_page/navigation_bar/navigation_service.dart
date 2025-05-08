import 'package:flutter/material.dart';
import 'package:practising_folder/my_home_page/navigation_bar/navigation_model.dart';

class NavigationService {
  List<NavigationModel> getDestinations() {
    return [
      NavigationModel(icon: Icons.widgets_outlined, selectedIcon: Icons.widgets, label: 'Widgets'),
      NavigationModel(icon: Icons.format_paint_outlined, selectedIcon: Icons.format_paint, label: 'Design'),
      NavigationModel(icon: Icons.settings_outlined, selectedIcon: Icons.settings, label: 'Settings'),
    ];
  }
}

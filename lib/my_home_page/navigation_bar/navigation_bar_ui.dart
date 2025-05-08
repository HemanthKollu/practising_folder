import 'package:flutter/material.dart';
import 'package:practising_folder/my_home_page/navigation_bar/navigation_model.dart';
import 'package:practising_folder/my_home_page/navigation_bar/navigation_service.dart';

class NavigationBarExample extends StatefulWidget {
  const NavigationBarExample({super.key});

  @override
  State<NavigationBarExample> createState() => _NavigationBarExampleState();
}

class _NavigationBarExampleState extends State<NavigationBarExample> {
  NavigationService service = NavigationService();
  List<NavigationModel> destinations = [];
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    destinations = service.getDestinations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            NavigationRail(
              selectedIndex: selectedIndex,
              onDestinationSelected: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              labelType: NavigationRailLabelType.all,
              destinations:
                  destinations.map((e) {
                    return NavigationRailDestination(icon: Icon(e.icon), selectedIcon: Icon(e.selectedIcon), label: Text(e.label));
                  }).toList(),
            ),
            Expanded(child: Center(child: Text('Selected: ${destinations[selectedIndex].label}'))),
          ],
        ),
      ),
    );
  }
}

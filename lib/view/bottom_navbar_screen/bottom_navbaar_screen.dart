import 'package:clone_prjt/view/event_screen/event_screen.dart';
import 'package:clone_prjt/view/history_screen/history_screen.dart';
import 'package:clone_prjt/view/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class BottomNavbarScreen extends StatefulWidget {
  const BottomNavbarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavbarScreen> createState() => _BottomNavbarScreenState();
}

class _BottomNavbarScreenState extends State<BottomNavbarScreen> {
  int selectedTab = 0;
  String currentLocation = "Your default location";

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      Homescreen(),
      EventScreen(),
      FoodOrderHistoryScreen(currentLocation: currentLocation),
    ];

    return Scaffold(
      body: screens[selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedTab,
        onTap: (int index) {
          setState(() {
            selectedTab = index;
          });
        },
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.delivery_dining),
            label: 'Delivery',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
        ],
      ),
    );
  }
}

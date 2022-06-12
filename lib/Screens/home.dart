import 'package:fyp_driver/Models/parcel_model.dart';
import 'package:flutter/material.dart';
import 'package:fyp_driver/Screens/delivered_screen.dart';
import 'package:fyp_driver/Screens/destinations.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();

  HomeScreen();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> screen = [];
  int selectedIndex = 0;
  bool isLoading = false;

  @override
  void initState() {
    screen.add(DestinationsPage());
    screen.add(DeliveredScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: Colors.green,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "My Parcels"),
          BottomNavigationBarItem(icon: Icon(Icons.mail), label: "Delivered")
        ],
      ),
      body: screen[selectedIndex],
    );
  }
}

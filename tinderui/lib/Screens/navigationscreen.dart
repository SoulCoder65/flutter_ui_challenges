import 'package:flutter/material.dart';
//Screens
import 'homescreen.dart';
import '../Screens/Like Page/Tabs.dart';
import '../Screens/not_develop.dart';
//COnstants
import '../Constants/colors.dart';

class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final colorpallete = Colorpallete();
  int _selectedPage = 0;
  List<Widget> _ScreenOptions = [
    HomeScreen(),
    Tabs(),
    NotDeveloped(),
    NotDeveloped(),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _ScreenOptions.elementAt(_selectedPage),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.local_fire_department_rounded,
              ),
              backgroundColor: Color.fromARGB(255, 68, 68, 68),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
              ),
              backgroundColor: Color.fromARGB(255, 68, 68, 68),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.messenger_rounded,
              ),
              backgroundColor: Color.fromARGB(255, 68, 68, 68),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              backgroundColor: Color.fromARGB(255, 68, 68, 68),
              label: ""),
        ],
        type: BottomNavigationBarType.shifting,
        backgroundColor: colorpallete.home_screen_bg,
        currentIndex: _selectedPage,
        selectedItemColor: _selectedPage==1?Colors.yellow:colorpallete.splash_bg_initial,
        iconSize: 25,
        onTap: _onPageChanged,
      ),
    );
  }
}

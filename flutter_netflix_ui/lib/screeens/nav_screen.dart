import 'package:flutter/material.dart';
import 'package:flutter_netflix_ui/screeens/home_screen.dart';
import '/widgets/widgets.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    HomeScreen(key: PageStorageKey('Home')),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  int _currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentindex],
      bottomNavigationBar: !Responsive.isDesktop(context)
          ? BottomNavigationBar(
              items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.search), label: 'Search'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.file_download), label: 'Download'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.menu), label: 'More'),
                ],
              currentIndex: _currentindex,
              selectedItemColor: Colors.white,
              backgroundColor: Colors.black,
              unselectedItemColor: Colors.grey,
              selectedFontSize: 11.0,
              unselectedFontSize: 11.0,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                setState(() {
                  _currentindex = index;
                });
              })
          : null,
    );
  }
}

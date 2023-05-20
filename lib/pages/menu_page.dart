import 'package:flutter/material.dart';
import 'package:tamyrlan/pages/create_page.dart';
import 'package:tamyrlan/pages/home_page.dart';
import 'package:tamyrlan/pages/profile_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    CreatePage(),
    ProfilePage()
  ];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? Image.asset('assets/images/activate_home.png')
                : Image.asset('assets/images/home.png'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? Image.asset('assets/images/activate_create.png')
                : Image.asset('assets/images/create.png'),
            label: 'Create',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? Image.asset('assets/images/activate_user.png')
                : Image.asset('assets/images/user.png'),
            label: 'Profile',
          ),
        ],
        onTap: _onItemTapped,
        selectedItemColor: const Color.fromRGBO(100, 93, 215, 1),
        currentIndex: _selectedIndex,
        selectedLabelStyle:
            const TextStyle(color: Color.fromRGBO(100, 93, 215, 1)),
        unselectedLabelStyle:
            const TextStyle(color: Color.fromRGBO(194, 194, 194, 1)),
        showUnselectedLabels: true,
      ),
    );
  }
}

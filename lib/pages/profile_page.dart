import 'package:flutter/material.dart';

import 'product_view.dart';
import 'home_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    ProductView(),
    ProfilePage(),
  ];
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => _widgetOptions[_selectedIndex]));
  }

  @override
  Widget build(BuildContext context) {
    return 
       Center(
        child: Text('Profile Page'),
      );
    //   bottomNavigationBar: BottomNavigationBar(
    //     items: [
    //       BottomNavigationBarItem(
    //         icon: _selectedIndex == 2
    //             ? Image.asset('assets/images/activate_home.png')
    //             : Image.asset('assets/images/home.png'),
    //         label: 'Home',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: _selectedIndex == 1
    //             ? Image.asset('assets/images/activate_create.png')
    //             : Image.asset('assets/images/create.png'),
    //         label: 'Create',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: _selectedIndex == 0
    //             ? Image.asset('assets/images/activate_user.png')
    //             : Image.asset('assets/images/user.png'),
    //         label: 'Profile',
    //       ),
    //     ],
    //     selectedItemColor: const Color.fromRGBO(100, 93, 215, 1),
    //     onTap: _onItemTapped,
    //     currentIndex: _selectedIndex,
    //     selectedLabelStyle:
    //         const TextStyle(color: Color.fromRGBO(100, 93, 215, 1)),
    //     unselectedLabelStyle:
    //         const TextStyle(color: Color.fromRGBO(194, 194, 194, 1)),
      
    // );
  }
}

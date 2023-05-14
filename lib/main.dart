import 'package:flutter/material.dart';
import 'package:tamyrlan/pages/home_page.dart';
import 'package:tamyrlan/pages/menu_page.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'Bitter',
        primaryColor: const Color.fromRGBO(100, 93, 215, 1),
      ),
      home: MenuPage(),
    ),
  );
}

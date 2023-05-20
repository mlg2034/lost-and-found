import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tamyrlan/app.dart';
import 'package:tamyrlan/pages/login_page.dart';
import 'package:tamyrlan/pages/menu_page.dart';

import 'app_initializer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dio = await AppInitializer.initialize();
  // SystemChrome.setPreferredOrientations(
  //   [DeviceOrientation.portraitUp],
  // ); // Removed screen position changing
  runApp(App(dio));
}

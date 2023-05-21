import 'package:flutter/material.dart';
import 'package:tamyrlan/pages/login_page.dart';
import 'package:tamyrlan/pages/menu_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
void main() {
  runApp(
    ScreenUtilInit(
     designSize: const Size(360 , 690),
     minTextAdapt: true,
     splitScreenMode: true,
      builder: (BuildContext context, Widget? child) { 
       
      return MaterialApp(
        theme: ThemeData(
           useMaterial3: true,
          fontFamily: 'Bitter',
          primaryColor: const Color.fromRGBO(100, 93, 215, 1),
        ),
        home: LoginPage(),
      );
      }
    ),
  );
}

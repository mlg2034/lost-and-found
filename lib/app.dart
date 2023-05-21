import 'dart:io';

import 'package:dio/dio.dart';
import 'package:tamyrlan/pages/home_page.dart';
import 'package:tamyrlan/pages/login_page.dart';
import 'package:tamyrlan/pages/menu_page.dart';
import 'package:tamyrlan/pages/profile_page.dart';
import 'package:tamyrlan/data/db/box_helper.dart';
import 'package:tamyrlan/data/db/hives.dart';
import 'package:tamyrlan/data/repository/data_auth_repository.dart';
import 'package:tamyrlan/domain/repository/auth_repository.dart';
import 'package:tamyrlan/domain/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'data/repository/data_post_repository.dart';
import 'domain/repository/post_repository.dart';

class App extends StatelessWidget {
  final Dio _dio;
  final bool isMock;

  const App(
      this._dio, {
        Key? key,
        this.isMock = false,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (context) => DataAuthRepository(_dio),
        ),
        RepositoryProvider<PostRepository>(
          create: (context) => DataPostRepository(_dio),
        ),

      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AppViewState();
  }
}

class AppViewState extends State<AppView> {

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Hive.box(Hives.boxSettings).listenable(),
        builder: (context, Box box, widget) {
          return MaterialApp(
            title: 'Lost and Found',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: _getFirstPage(),
          );
        });
  }

  Widget _getFirstPage() {
    if (!BoxHelper.hasToken()) {
      return const LoginPage();
    }
    return const MenuPage();
  }
}

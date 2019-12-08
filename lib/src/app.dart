import 'package:flutter/material.dart';
import 'package:movie_app/src/ui/home_page.dart';
import 'package:movie_app/src/ui/login.dart';
import 'package:movie_app/src/ui/register.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      //home: HomePage(),
      initialRoute: '/',
      routes: {
        '/' : (BuildContext context) => HomePage(),
        '/login' : (BuildContext context) => Login(),
        '/register' : (BuildContext context) => Register(),
      },
    );
  }
}

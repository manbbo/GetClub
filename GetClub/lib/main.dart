import 'package:flutter/material.dart';
import 'package:getclub/pages/login.dart';
import 'package:getclub/view/navigator_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GetClub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: new Color(0xFFa8131d),
        primaryColorLight: new Color(0xFFa8131d),
        primaryColorDark: new Color(0xff720000),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Login_Page(title: "Login"),
        '/first': (context) => Navigation(),
        //'/second': (context) => User_Page(),
      },
    );
  }
}
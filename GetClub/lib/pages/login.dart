import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getclub/widgets/login_widgets.dart';

// ignore: camel_case_types
class Login_Page extends StatefulWidget {
  final String title;

  Login_Page({this.title});

  @override
  _Login_PageState createState() => _Login_PageState();
}

// ignore: camel_case_types
class _Login_PageState extends State<Login_Page> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(top: 200, left: 30, right: 30),
            width: 300,
            alignment: Alignment.topCenter,
            child: Image(image: AssetImage('assets/images/logo/getclub.png')),
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            height: 210,
            child: LoginContainer(),
            decoration: BoxDecoration(color: Colors.white),
          )
        ],
      ),
    );
  }
}
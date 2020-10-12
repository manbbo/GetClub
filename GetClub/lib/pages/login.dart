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
  double height;
  bool focus;

  @override
  void initState() {
    super.initState();
    focus = false;
  }

  double getHeight(BuildContext context, bool focused) {
    setState(() {
      height = MediaQuery.of(context).size.height - 230;
    });

    return height;
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey positioned = GlobalKey();

    return new Scaffold(
        body: new SingleChildScrollView(
      child: new Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bkglogin.png'),
                fit: BoxFit.cover)),
        child: Stack(
          alignment: Alignment.center,
          children: [
            new Container(
              padding: EdgeInsets.only(top: 127),
              width: 291,
              alignment: Alignment.topCenter,
              child: Image(image: AssetImage('assets/images/logo/getclub.png')),
            ),
            new Container(
                child: new Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              width: MediaQuery.of(context).size.width - 40,
              child: LoginContainer(),
              decoration: BoxDecoration(
                  //color: new Color(0xFFA8131D),
                  borderRadius: BorderRadius.circular(10)),
            ))
          ],
        ),
      ),
    ));
  }
}
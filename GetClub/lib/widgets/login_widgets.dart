import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getclub/widgets/focus.dart';

// ignore: must_be_immutable
class LoginContainer extends StatefulWidget {
  TextEditingController username =
  new TextEditingController(text: "paulo.silva@getclub.com"),
      password = new TextEditingController(text: "thisisapassword");

  GlobalKey user = new GlobalKey(),
      pass = new GlobalKey(),
      button = new GlobalKey();

  @override
  _LoginContainerState createState() => _LoginContainerState();
}

class _LoginContainerState extends State<LoginContainer> {
  FocusNode focusUser, focusPassword;

  @override
  void initState() {
    super.initState();
    focusUser = FocusNode();
    focusPassword = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    focusUser.dispose();
    focusPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.center,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(top: 220),
            //height: 450,
            width: MediaQuery.of(context).size.width,
            child: Image(image: AssetImage('assets/images/login/group.png')),
          ),
          Container(
            height: 50,
          ),
          EnsureVisibleWhenFocused(
              child: TextField(
                //key: widget.user,
                decoration:
                    InputDecoration(hintText: "Coloque seu Usuário aqui"),
                controller: widget.username,
                focusNode: focusUser,
              ),
              focusNode: focusUser),
          EnsureVisibleWhenFocused(
            child: TextField(
              //key: widget.pass,
              decoration: InputDecoration(hintText: "Coloque sua Senha aqui"),
              controller: widget.password,
              obscureText: true,
              focusNode: focusPassword,
            ),
            focusNode: focusPassword,
          ),
          Container(
            width: 267,
            padding: EdgeInsets.only(top: 10),
            child: RaisedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/first');
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                "LOGIN",
                style: TextStyle(color: new Color(0xFFa8131d), fontSize: 24),
              ),
              color: Colors.white,
            ),
          ),
          GestureDetector(
            child: Text(
              "Esqueci minha senha",
              style: TextStyle(fontSize: 12, color: new Color(0xffE5E5E5)),
            ),
          )
        ],
      ),
    );
  }
}

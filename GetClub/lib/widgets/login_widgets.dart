import 'package:flutter/material.dart';

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


  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.center,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // text input de login
          // text input de password
          // botao de logar
          Container(
            padding: EdgeInsets.only(top: 20,  left: 40, right: 40),
            child: TextField(
              key: widget.user,
              decoration: InputDecoration(
                  hintText: "Coloque seu Usuário aqui",
                  suffixIcon: Icon(Icons.person)
              ),
              controller: widget.username,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10, left: 40, right: 40),
            child: TextField(
              key: widget.pass,
              decoration: InputDecoration(
                  hintText: "Coloque sua Senha aqui",
                  suffixIcon: Icon(Icons.paste_sharp)
              ),
              controller: widget.password,
              obscureText: true,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 30),
            child: RaisedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/first');
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Text("LOGIN", style: TextStyle(color: Colors.white, fontSize: 20),),
              color: new Color(0xFFa8131d),
            ),
          ),
        ],
      ),
    );
  }
}
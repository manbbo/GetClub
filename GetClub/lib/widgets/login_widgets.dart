import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getclub/widgets/focus.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:web_socket_channel/web_socket_channel.dart';

// ignore: must_be_immutable
class LoginContainer extends StatefulWidget {
  TextEditingController username =
          new TextEditingController(text: "jonassantos@email.com"),
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
              child: TextFormField(
                //key: widget.user,
                decoration:
                InputDecoration(hintText: "Usuário"),
                controller: widget.username,
                focusNode: focusUser,
                style: TextStyle(color: Colors.white),
              ),
              focusNode: focusUser),
          EnsureVisibleWhenFocused(
            child: TextFormField(
              //key: widget.pass,
              decoration: InputDecoration(hintText: "Senha"),
              controller: widget.password,
              obscureText: true,
              focusNode: focusPassword,
              style: TextStyle(color: Colors.white),
            ),
            focusNode: focusPassword,
          ),
          Container(
            width: 267,
            padding: EdgeInsets.only(top: 10),
            child: RaisedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/first');
                createAndLog() async {
                  var userChannel = WebSocketChannel.connect(
                      Uri.parse("http://localhost:3333/user"));
                  userChannel.sink.add(
                      '"name": "Jonas Santos",'
                          '"email": "jonassantos@email.com",'
                          '"password":"thisisapassword"'
                  );

                  userChannel.stream.listen((message) {
                    userChannel.sink.close(status.goingAway);
                  });
                }

                createAndLog();
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
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

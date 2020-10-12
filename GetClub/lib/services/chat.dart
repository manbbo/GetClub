// host (dar o io ) localhost:3333
// on (como recebera da API)
// emit (enviar para API)

import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

class UserCreate extends StatefulWidget {
  sendMessage(String msg) async {
    var chatConnection = IOWebSocketChannel.connect("http://localhost:3333");

    chatConnection.stream.listen((message) {
      chatConnection.sink.add("{"
          '"sender":"5f846feffb1b6f2e18cb9ff2",'
          '"addressee": "5f846718feede3342fcd3f66",'
          '"sendMessage":"$msg"'
          "}");
      chatConnection.sink.close(status.goingAway);
    });
  }

  // logar ja cria usuario
  @override
  _UserCreateState createState() => _UserCreateState();
}

class _UserCreateState extends State<UserCreate> {
  @override
  Widget build(BuildContext context) {
    return new StreamBuilder(builder: (context, snapshot) {
      //return 0;
    });
  }
}

// quando tiver logado, e estiver acessando a rota protegida, mandar token
// em service

class ChatService extends StatefulWidget {
  @override
  _ChatServiceState createState() => _ChatServiceState();
}

class _ChatServiceState extends State<ChatService> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

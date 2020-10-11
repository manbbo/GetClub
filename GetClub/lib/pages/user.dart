import 'package:flutter/material.dart';
import 'package:getclub/widgets/user_widgets.dart';

// ignore: camel_case_types
class User_Page extends StatefulWidget {
  @override
  _User_PageState createState() => _User_PageState();
}

// ignore: camel_case_types
class _User_PageState extends State<User_Page> {
  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(
      child: new Container(
        padding: EdgeInsets.only(top: 40),
        child: Column(
          children: [
            UserHeader(
              username: "Jonas Santos",
            ),
            //new Container(height: 20,),
            UserInfo(
              email: "jonassantos@email.com",
              endereco: "Rua dos Diamantes 01, Bairro, Rj-Rj",
              cpf: "000.000.000-00",
              cnpj: "00.000.000/0001-00",
              descricao:
                  "Serviços de elétrica, há mais de 10 anos e atende em toda capital do Rio de Janeiro/RJ. ",
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: UserTipsEntrepreneurism(),
            ),
          ],
        ),
      ),
    );
  }
}
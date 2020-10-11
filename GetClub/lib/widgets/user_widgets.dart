import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserHeader extends StatefulWidget {
  String username;

  UserHeader({this.username});

  @override
  _UserHeaderState createState() => _UserHeaderState();
}

class _UserHeaderState extends State<UserHeader> {
  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        new Column(
          children: [
            Container(
              width: 218,
              height: 32,
              child: new Text(widget.username,
                  style: TextStyle(fontSize: 27, color: new Color(0xff413E3F))),
            )
          ],
        ),
        new Container(
          height: 87,
          width: 87,
          child: new Image(image: AssetImage('assets/images/profile_pic.png')),
        )
      ],
    );
  }
}

class UserInfo extends StatefulWidget {
  String email, endereco, cpf, descricao, cnpj;

  UserInfo({this.email, this.descricao, this.endereco, this.cpf, this.cnpj});

  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      width: MediaQuery.of(context).size.width - 40,
      child: new Column(
        children: [
          TextFormField(
            controller: new TextEditingController(text: widget.email.trim()),
          ),
          Container(
            height: 4,
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              "EMAIL",
              style: TextStyle(fontSize: 10, color: Color(0xffDADADA)),
            ),
          ),
          TextFormField(
            controller: new TextEditingController(text: widget.endereco.trim()),
          ),
          Container(
            height: 4,
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              "ENDEREÇO",
              style: TextStyle(fontSize: 10, color: Color(0xffDADADA)),
            ),
          ),
          TextFormField(
            controller: new TextEditingController(text: widget.cpf.trim()),
          ),
          Container(
            height: 4,
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              "CPF",
              style: TextStyle(fontSize: 10, color: Color(0xffDADADA)),
            ),
          ),
          TextFormField(
            controller: new TextEditingController(text: widget.cnpj.trim()),
          ),
          Container(
            height: 4,
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              "CNPJ",
              style: TextStyle(fontSize: 10, color: Color(0xffDADADA)),
            ),
          ),
          TextFormField(
            maxLines: 2,
            maxLength: 100,
            textAlign: TextAlign.justify,
            controller:
                new TextEditingController(text: widget.descricao.trim()),
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              "DESCRIÇÃO DO SERVIÇO (MAX 100 PALAVRAS)",
              style: TextStyle(fontSize: 10, color: Color(0xffDADADA)),
            ),
          ),
          new Container(
            height: 10,
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Container(
                  width: 190,
                  height: 41,
                  child: new FlatButton(
                    onPressed: () {},
                    child: Text("Salvar Informações"),
                    color: Color(
                      0xFFA8131D,
                    ),
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                new Container(
                  width: 26,
                ),
                new Container(
                  child: RaisedButton(
                    child: Text(
                      "Excluir Conta",
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(
                            color: Color(
                          0xFFa8131d,
                        ))),
                    textColor: Color(0xFFa8131d),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class UserTipsEntrepreneurism extends StatefulWidget {
  @override
  _UserTipsEntrepreneurismState createState() =>
      _UserTipsEntrepreneurismState();
}

class _UserTipsEntrepreneurismState extends State<UserTipsEntrepreneurism> {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: [
        Row(
          children: [
            Container(
              width: 13,
              height: 13,
              child: Image(
                image: AssetImage("assets/images/bola.png"),
              ),
            ),
            Container(
              width: 10,
            ),
            Text(
              "Dicas de empreendedorismo",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        new Container(
          height: 13,
        ),
        new Container(
          width: MediaQuery.of(context).size.width,
          height: 162,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black54),
              borderRadius: BorderRadius.circular(10)),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new Container(
                width: 181,
                height: 143,
                child: Image(
                  image: AssetImage("assets/images/user/empreend.png"),
                ),
              ),
              new Container(
                width: 9,
              ),
              new Container(
                width: 135,
                height: 115,
                child: Text(
                  "Quer ser um empreendedor de sucesso? Assista ao vídeo e descubra se você está no caminho certo no mundo do empreendedorismo. Veja também as dicas para se tornar um bom líder para os seus negócios",
                  style: TextStyle(fontSize: 10),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

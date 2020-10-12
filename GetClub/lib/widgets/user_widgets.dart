import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getclub/services/youtube.dart';

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
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          // retorna um objeto do tipo Dialog
                          return AlertDialog(
                            title: new Text(
                              "Deletar Conta",
                              textAlign: TextAlign.center,
                            ),
                            content: new Text(
                              "Que pena está deletando sua conta."
                              "\nVocê tem certeza dessa decisão?",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 13),
                            ),
                            actions: <Widget>[
                              // define os botões na base do dialogo
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    new Container(
                                      width: 102,
                                      height: 41,
                                      child: new FlatButton(
                                        child: new Text(
                                          "Sim",
                                          style: TextStyle(fontSize: 24),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            side: BorderSide(
                                                color: Color(
                                              0xFFa8131d,
                                            ))),
                                        textColor: Color(0xFFa8131d),
                                        color: Colors.white,
                                      ),
                                    ),
                                    new Container(
                                      width: 39,
                                    ),
                                    new Container(
                                      width: 102,
                                      height: 41,
                                      child: new RaisedButton(
                                        child: new Text(
                                          "Não",
                                          style: TextStyle(fontSize: 24),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        color: Color(
                                          0xFFA8131D,
                                        ),
                                        textColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
                new Container(
                  width: 12,
                ),
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
    return new Scaffold(
      body: new Container(
        padding: EdgeInsets.only(top: 30),
        child: new Column(
          children: [
            new Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: 40,
              alignment: Alignment.topCenter,
              child: new Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: Text("Faça negócios com"),
            ),
            new Container(height: 10,),
            new Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width - 40,
              child: new Column(
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
                      new Container(
                        width: MediaQuery.of(context).size.width-80, height: 54,
                        child: Text(
                          "Em nossa parceria com Sebrae personalizamos os melhores vídeos para você se tornar um empreendedor de sucesso!",
                          style: TextStyle(fontSize: 13,),
                          softWrap: true,
                          textAlign: TextAlign.justify,
                        ),
                      )
                    ],
                  ),
                  new Container(
                    height: 13,
                  ),
                  new GestureDetector(
                      onTap: () =>
                          Navigator.of(context).push(
                              new MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return new Youtube_View(
                                        url: "https://youtu.be/ARYqzdvicQ0",
                                        pageName: "EMPREENDEDORISMO");
                                  })),
                      //_launchURL,
                      child: new Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        height: 162,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black54),
                            borderRadius: BorderRadius.circular(10)),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            new Container(
                              width: 165,
                              height: 143,
                              child: Image(
                                image: AssetImage(
                                    "assets/images/user/empreend.png"),
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
                      )),
                  new Container(height: 26,),
                  new GestureDetector(
                      onTap: () =>
                          Navigator.of(context).push(
                              new MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return new Youtube_View(
                                        url: "https://www.youtube.com/watch?v=eXr_IKiAa2w&ab_channel=Sebrae",
                                        pageName: "EMPREENDEDORISMO");
                                  })),
                      //_launchURL,
                      child: new Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        height: 162,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black54),
                            borderRadius: BorderRadius.circular(10)),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            new Container(
                              width: 165,
                              height: 143,
                              child: Image(
                                image: AssetImage(
                                    "assets/images/user/dicas.png"),
                              ),
                            ),
                            new Container(
                              width: 9,
                            ),
                            new Container(
                              width: 135,
                              height: 115,
                              child: Text(
                                "As LIVES invadiram a internet e estão ajudando muitas empresas a se aproximarem dos seus clientes. Uma das principais plataformas é o Instagram, por isso o Sebrae preparou esse vídeo com dicas sobre como usar.",
                                style: TextStyle(fontSize: 10),
                              ),
                            )
                          ],
                        ),
                      )),
                  new Container(height: 26,),
                  new GestureDetector(
                      onTap: () =>
                          Navigator.of(context).push(
                              new MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return new Youtube_View(
                                        url: "https://youtu.be/Fh_3pwqXqzg",
                                        pageName: "EMPREENDEDORISMO");
                                  })),
                      //_launchURL,
                      child: new Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        height: 162,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black54),
                            borderRadius: BorderRadius.circular(10)),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            new Container(
                              width: 165,
                              height: 143,
                              child: Image(
                                image: AssetImage(
                                    "assets/images/user/coronga.png"),
                              ),
                            ),
                            new Container(
                              width: 9,
                            ),
                            new Container(
                              width: 135,
                              height: 115,
                              child: Text(
                                "Este vídeo faz parte de uma série de conteúdos dedicados a quem está na luta diária para manter sua empresa funcionando. Esperamos assim ajudá-lo(a) a minimizar os efeitos da crise provocada pelo Coronavírus.",
                                style: TextStyle(fontSize: 10),
                              ),
                            )
                          ],
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class UserGetToEntrepreneurism extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey)
      ),
      width: 341,
      height: 142,
      alignment: Alignment.center,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Container(
            width: 151, height: 114,
            child: Image(image: AssetImage("assets/images/user/people.png"),),
          ),
          new Container(width: 17,),
          new Container(
            width: 147,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Quer ser um empreendedor de sucesso? Confira uma jornada personalizada para o  seu empreendimento",
                  style: TextStyle(fontSize: 10), softWrap: true,),
                new Container(height: 14,),
                new Container(
                  width: 134, height: 41,
                  child: new FlatButton(
                    onPressed: () {
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) {
                            return new UserTipsEntrepreneurism();
                          }));
                    },
                    child: Text("Veja mais"),
                    color: Color(
                      0xFFA8131D,
                    ),
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
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

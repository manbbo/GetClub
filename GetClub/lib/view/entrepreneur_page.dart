import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getclub/widgets/home_widgets.dart';

class EntrepreneurPage extends StatefulWidget {
  String name, image, evalAndSector, description, address;

  EntrepreneurPage(
      {this.name,
      this.image,
      this.evalAndSector,
      this.description,
      this.address});

  @override
  _EntrepreneurPageState createState() => _EntrepreneurPageState();
}

class _EntrepreneurPageState extends State<EntrepreneurPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(top: 30, left: 10, right: 10),
        child: new Column(
          children: [
            new Container(
              width: MediaQuery.of(context).size.width,
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
              width: MediaQuery.of(context).size.width,
              child: Text("Faça negócios com"),
            ),
            new Container(
              width: MediaQuery.of(context).size.width,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new Container(
                    width: 220,
                    height: 81,
                    child: new Column(
                      children: [
                        new Container(
                          width: 220,
                          child: Text(
                            widget.name,
                            style: TextStyle(fontSize: 27),
                          ),
                        ),
                        new Container(
                          child: Row(
                            children: [
                              new Container(
                                width: 19,
                                height: 19,
                                child: Image(
                                    image: AssetImage(
                                        "assets/images/home/star.png")),
                              ),
                              Text(widget.evalAndSector)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  new Container(
                    width: 97,
                    height: 97,
                    child: Image(
                      image:
                      AssetImage("assets/images/home/${widget.image}.png"),
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Container(
              height: 10,
            ),
            new Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: new Column(
                children: [
                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width - 40,
                    child: Text("Endereço:"),
                  ),
                  Container(
                    height: 5,
                  ),
                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width - 40,
                    child: Text(widget.address),
                  )
                ],
              ),
            ),
            Divider(),
            new Container(
              width: MediaQuery.of(context).size.width,
              height: 110,
              child: new Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 40,
                    child: Text("Descrição:"),
                  ),
                  Container(
                    height: 5,
                  ),
                  Container(
                    width: MediaQuery
                        .of(context).size.width - 40,
                    child: Text(widget.description),
                  )
                ],
              ),
            ),
            Container(
              height: 36,
            ),
            new Row(
              children: [
                new Container(
                  width: 180,
                  height: 41,
                  child: RaisedButton(
                    child: Text(
                      "Faça sua proposta",
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(
                            color: Color(
                          0xFFa8131d,
                        ))),
                    textColor: Color(0xFFa8131d),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                ),
                new Container(
                  width: 180,
                  height: 41,
                  child: FlatButton(
                    child: Text(
                      "Realizar pagamento",
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(
                            color: Color(
                          0xFFa8131d,
                        ))),
                    textColor: Color(0xFFa8131d),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            Container(
              height: 44,
            ),
            HomeProfessionals(
              thumbnail: "Avaliação do Negócio",
              name: const [
                "Negício excelente. Muito bom",
                'Otima empresa! Escolha certa!!!'
              ],
              image: const ["avatar1", "avatar3"],
            )
          ],
        ),
      ),
    );
  }
}

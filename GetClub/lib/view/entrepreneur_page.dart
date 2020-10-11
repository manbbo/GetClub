import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                  ),
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
            )
          ],
        ),
      ),
    );
  }
}

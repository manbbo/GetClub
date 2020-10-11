import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getclub/view/entrepreneur_page.dart';

// ignore: camel_case_types
class Home_Widgets extends StatefulWidget {
  @override
  _Home_WidgetsState createState() => _Home_WidgetsState();
}

// ignore: camel_case_types
class _Home_WidgetsState extends State<Home_Widgets> {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: [
        new Positioned(
          top: 60,
          width: MediaQuery.of(context).size.width,
          child: HomeHeader(
            username: "Jonas Santos",
          ),
        ),
        new Positioned(
          top: 170,
          width: MediaQuery.of(context).size.width,
          //height: MediaQuery.of(context).size.height,
          child: HomeCarousel(),
        ),
        new Positioned(
            top: 450,
            width: MediaQuery.of(context).size.width,
            child: HomeProfessionals())
      ],
    );
  }
}

class HomeHeader extends StatefulWidget {
  String username;

  HomeHeader({this.username});

  @override
  _HomeHeaderState createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        new Column(
          children: [
            Container(
              width: 218,
              child: new Text(
                "Seja bem-vindo,",
                style: TextStyle(fontSize: 14, color: new Color(0xff413E3F)),
              ),
            ),
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

class HomeCarousel extends StatefulWidget {
  @override
  _HomeCarouselState createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  Widget CarouselItems(String image, String label) {
    return Container(
        child: Stack(
      children: [
        Image(
          image: AssetImage('assets/images/home/$image.png'),
        ),
        Container(
          child: Text(
            label,
            style: TextStyle(fontSize: 17, color: Color(0xff413E3F)),
          ),
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.only(bottom: 12, left: 12),
        )
      ],
    ));
  }

  List<Widget> items;

  @override
  void initState() {
    super.initState();
    items = List<Widget>();

    for (int i = 0; i < 6; i++) {
      items.add(CarouselItems('oficinas', 'Mecânicos'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: [
        Container(
            width: MediaQuery.of(context).size.width,
            height: 40,
            padding: EdgeInsets.only(left: 22),
            child: new Row(
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
                  "Os melhores das categorias",
                  style: TextStyle(color: new Color(0xff413E3F), fontSize: 20),
                ),
              ],
            )
            //
            ),
        Container(
          padding: EdgeInsets.only(top: 35),
          child: CarouselSlider(
            options: CarouselOptions(
              scrollDirection: Axis.horizontal,
              height: 200.0,
              //enlargeCenterPage: true,
              viewportFraction: 0.7,
              initialPage: 0,
            ),
            items: [0, 1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return items[i];
                },
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}

class HomeProfessionals extends StatefulWidget {
  String thumbnail;
  List<String> name = new List(2),
      image = new List(2);

  HomeProfessionals({this.thumbnail = "Empreendedores na sua região",
    this.name = const ["Adriana Serviços de Tecnologia", 'Personal Home'],
    this.image = const ["avatar1", "avatar2"]});

  @override
  _HomeProfessionalsState createState() => _HomeProfessionalsState();
}

class _HomeProfessionalsState extends State<HomeProfessionals> {
  Widget botao(String image, String name) {
    return new GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            new MaterialPageRoute(builder: (BuildContext context) {
              return new EntrepreneurPage(
                image: image,
                name: name,
                address: "Rua dos Topázios 01, Bairro, RJ - RJ",
                description: "oferece serviços de limpeza domiciliar e empresarial. Já tem mais de 15 anos no mercado, oferecendo o melhor do serviço de organização e limpeza para seus clientes. Agenda de novembro aberta.",
                evalAndSector: " (4,5) Manutenção e Limpeza",);
            }));
      },
      child: Container(
        width: 333,
        height: 67,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(color: Colors.black54)
        ),
        child: Row(
          children: [
            new Container(
              width: 48,
              height: 48,
              child: Image(image: AssetImage("assets/images/home/$image.png")),
            ),
            new Container(width: 10,),
            Container(
              width: 220,
              child: Column(
                children: [
                  new Container(height: 5,),
                  new Container(
                    width: 220,
                    child: Text(name, style: TextStyle(fontSize: 14),),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 19,
                        height: 19,
                        child: Image(
                            image: AssetImage("assets/images/home/star.png")),
                      ),
                      Text(" (4,5) - 3km")
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: new Column(
        children: [
          new Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              padding: EdgeInsets.only(left: 22),
              child: Row(
                children: [
                  Container(width: 13, height: 13,
                    child: Image(image: AssetImage("assets/images/bola.png"),),
                  ),
                  Container(width: 10,),
                  Text(widget.thumbnail, style: TextStyle(fontSize: 20),),
                ],
              )

            //
          ),
          Container(height: 30,),
          botao(widget.image[0], widget.name[0]),
          Container(height: 22,),
          botao(widget.image[1], widget.name[1]),
        ],
      ),
    );
  }
}

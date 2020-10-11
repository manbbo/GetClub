import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          height: MediaQuery.of(context).size.height,
          child: HomeCarousel(),
        )
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
      child: Image(
        image: AssetImage('assets/images/home/$image.png'),
        semanticLabel: label,
      ),
    );
  }

  List<Widget> items;

  @override
  void initState() {
    super.initState();
    items = List<Widget>();

    for (int i = 0; i < 6; i++) {
      items.add(CarouselItems('oficinas', 'Oficinas Mecânicas'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: [
        Container(
          width: 200,
          height: 40,
          child: Text("Os melhores das categorias"),
        ),
        Container(
          child: CarouselSlider(
            options: CarouselOptions(
              scrollDirection: Axis.horizontal,
              height: 270.0,
              enlargeCenterPage: true,
              viewportFraction: 0.7,
              aspectRatio: 2.0,
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

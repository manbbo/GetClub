import 'package:flutter/material.dart';
import 'package:getclub/pages/chat.dart';
import 'package:getclub/pages/home.dart';
import 'package:getclub/pages/search.dart';
import 'package:getclub/pages/user.dart';
import 'package:getclub/services/chat.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  List<String> titles = ["HOME", "BUSCAR", "MENSAGENS", "PERFIL"];
  List<Widget> bodies = [
    new User_Page(),
    new Home_Page(),
    new Search_Page(),
    new ChatPage()
  ];

  int indexer = 1;

  void _selectIndex(int i) {
    setState(() {
      indexer = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: bodies[indexer],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: new Color(0xFFa8131d),
        unselectedItemColor: Colors.black54,
        iconSize: 30,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        onTap: (index) => _selectIndex(index),
        currentIndex: indexer,
        items: [
          BottomNavigationBarItem(
              icon: Container(
                height: 51,
                child:
                    Image(image: AssetImage('assets/images/profile_pic.png')),
              ),
              label: " "),
          BottomNavigationBarItem(
              icon: Container(
                height: 0,
              ),
              label: titles[0]),
          BottomNavigationBarItem(
              icon: Container(
                height: 0,
              ),
              label: titles[1]),
          BottomNavigationBarItem(
              icon: Container(
                height: 0,
              ),
              label: titles[2]),

        ],
      ),
    );
  }
}
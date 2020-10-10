import 'package:flutter/material.dart';
import 'package:getclub/pages/chat.dart';
import 'package:getclub/pages/home.dart';
import 'package:getclub/pages/orders.dart';
import 'package:getclub/pages/search.dart';
import 'package:getclub/pages/user.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  List<String> titles = ["HOME", "BUSCAR", "MEUS PEDIDOS", "CHAT", "PERFIL"];
  List<Widget> bodies = [new Home_Page(), new Search_Page(), new Orders_Page(), new Chat_Page(), new User_Page()];

  int indexer = 0;

  void _selectIndex(int i) {
    setState(() {
      indexer = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(titles[indexer], style: TextStyle(fontSize: 30),),
      ),
      body: bodies[indexer],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: new Color(0xFFa8131d),
        unselectedItemColor: Colors.black54,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 30,
        onTap: (index) => _selectIndex(index),
        currentIndex: indexer,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: titles[0]),
          BottomNavigationBarItem(
              icon: Icon(Icons.youtube_searched_for), label: titles[1]),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket), label: titles[2]),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble), label: titles[3]),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: titles[4])
        ],
      ),
    );
  }
}
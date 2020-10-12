import 'package:flutter/material.dart';
import 'package:getclub/widgets/search_widgets.dart';

// ignore: camel_case_types
class Search_Page extends StatefulWidget {
  @override
  _Search_PageState createState() => _Search_PageState();
}

// ignore: camel_case_types
class _Search_PageState extends State<Search_Page> {
  var search = new SearchWidget();

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.only(top: 30),
      child: new Stack(
        children: [SearchWidget()],
      ),
    );
  }
}
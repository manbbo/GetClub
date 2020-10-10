import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  SearchBar _searchBar = new SearchBar();

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: [
        _searchBar,
        Positioned(top: 70, child: SearchList(searchBar: _searchBar))
      ],
    );
  }
}

// ignore: camel_case_types
class SearchBar extends StatefulWidget {
  TextEditingController search = new TextEditingController();
  bool startSearching = false;

  @override
  _SearchBarState createState() => _SearchBarState();
}

// ignore: camel_case_types
class _SearchBarState extends State<SearchBar> {
  void _handleSubmitted(String value) {
    setState(() {
      this.widget.startSearching = true;
    });
  }

  void _handleEditted(String value) {
    setState(() {
      this.widget.startSearching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: [
        new Container(
          child: new TextFormField(
            controller: widget.search,
            decoration: InputDecoration(suffixIcon: Icon(Icons.search)),
            onFieldSubmitted: _handleSubmitted,
            onChanged: _handleEditted,
          ),
        ),
      ],
    );
  }
}

class SearchList extends StatefulWidget {
  List<Widget> listItems;
  SearchBar searchBar;

  SearchList({this.searchBar});

  @override
  _SearchListState createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  void implementList(Map<String, String> item, double screenWidth) {
    // first is name, second is description
    for (var i in item.keys) {
      widget.listItems.add(new Container(
          width: screenWidth,
          height: 120,
          child: new Row(
            children: [
              //Image,
              new Column(
                children: [Text(i), Text(item[i])],
              )
            ],
          )));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.searchBar.startSearching) {
      return new Container(
        child: Text("Procure o que precisa!"),
      );
    } else {
      if (widget.listItems != null) {
        if (widget.listItems.isEmpty) {
          return new Container(
            child: Text("Não há nada com esses termos"),
          );
        } else {
          return new ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return widget.listItems[index];
            },
            itemCount: widget.listItems.length,
            padding: EdgeInsets.all(5),
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          );
        }
      } else {
        return new Container(
          child: Text("Não há nada com esses termos"),
        );
      }
    }
  }
}

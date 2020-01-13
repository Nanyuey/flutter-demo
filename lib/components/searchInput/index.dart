import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => new _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String value;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: EdgeInsets.all(16),
      child: TextField(
        autofocus: true,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(5.0),
            border: OutlineInputBorder(),
            suffixIcon: Icon(Icons.search)),
      ),
    ));
  }
}

import 'package:flutter/material.dart';

class GoodPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("商品库"),
        ),
        body: Container(child: Text("goods")));
  }
}

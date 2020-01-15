import 'package:flutter/material.dart';
import 'package:store/routes/application.dart';
import 'package:store/routes/routes.dart';

class GoodsAdd extends StatefulWidget {
  @override
  _GoodsAddState createState() => new _GoodsAddState();
}

class _GoodsAddState extends State<GoodsAdd> {
  void goBack() {
    Application.router.navigateTo(context, Routes.home);
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('新建商品'),
        leading: new IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: goBack,
        ),
      ),
    );
  }
}

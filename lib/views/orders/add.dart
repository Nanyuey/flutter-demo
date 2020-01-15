import 'package:flutter/material.dart';
import 'package:store/routes/application.dart';
import 'package:store/routes/routes.dart';

class OrderAdd extends StatefulWidget {
  @override
  _OrderAddState createState() => new _OrderAddState();
}

class _OrderAddState extends State<OrderAdd> {
  void goBack() {
    Application.router.navigateTo(context, Routes.home);
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('新建订单'),
        leading: new IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: goBack,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:store/routes/application.dart';
import 'package:store/routes/routes.dart';

class CustomerAdd extends StatefulWidget {
  @override
  _CustomerAddState createState() => new _CustomerAddState();
}

class _CustomerAddState extends State<CustomerAdd> {
  void goBack() {
    Application.router.navigateTo(context, Routes.home);
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('新建客户'),
        leading: new IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: goBack,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class appBarActions extends StatefulWidget {
  final int currentType; // 0-客户管理 1-订单管理 2-商品管理
  appBarActions({Key key, this.currentType}) : super(key: key);
  @override
  _appBarActionsState createState() => new _appBarActionsState();
}

class _appBarActionsState extends State<appBarActions> {
  void toCustomerAdd() {}
  Widget build(BuildContext context) {
    if (widget.currentType == 0) {
      return IconButton(
        icon: Icon(Icons.add),
        onPressed: toCustomerAdd,
      );
    }
  }
}

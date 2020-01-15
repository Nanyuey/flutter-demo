import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../views/login.dart';
import '../views/home.dart';
import '../views/register.dart';
import '../views/customers/add.dart';
import '../views/goods/add.dart';
import '../views/orders/add.dart';

var homeHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new MyAppPage();
  },
);
var loginHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new LoginPage();
  },
);

var registerHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new MyRegister();
  },
);
var customersAddHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new CustomerAdd();
  },
);
var goodsAddHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new GoodsAdd();
  },
);
var orderAddHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new OrderAdd();
  },
);

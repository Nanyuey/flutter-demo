import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../views/login.dart';
import '../views/home.dart';

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

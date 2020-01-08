import 'package:flutter/material.dart';

class UserModel with ChangeNotifier {
  Map _userInfo = {};
  String _userName = '11111';
  Map get value => _userInfo;
  String get userName => _userName;
  void setInfo(Map info) {
    _userInfo = info;
    notifyListeners();
  }

  void setName(String userName) {
    _userName = userName;
    print('_userName,$_userName');
    notifyListeners();
  }
}

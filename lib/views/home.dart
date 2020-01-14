import 'package:flutter/material.dart';
import 'package:store/views/customers/customers.dart';
import 'package:store/views/goods/goods.dart';
import 'package:store/views/orders/orders.dart';
import 'package:store/components/drawer/index.dart';

class MyAppPage extends StatefulWidget {
  @override
  _MyAppPageState createState() => _MyAppPageState();
}

class _MyAppPageState extends State<MyAppPage> {
  List<Widget> _list = List();
  int _currentIndex = 0;
  List tabData = [
    {'text': '客户管理', 'icon': Icon(Icons.import_contacts)},
    {'text': '订单管理', 'icon': Icon(Icons.account_circle)},
    {'text': '商品管理', 'icon': Icon(Icons.extension)},
    //https://flutter-go.pub/api/isInfoOpen
  ];
  String appBarTitle;
  List<BottomNavigationBarItem> _myTabs = [];
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < tabData.length; i++) {
      _myTabs.add(BottomNavigationBarItem(
        icon: tabData[i]['icon'],
        title: Text(
          tabData[i]['text'],
        ),
      ));
    }
    _list..add(CustomerPage())..add(OrderPage())..add(GoodPage());
  }

  void _itemTapped(int index) {
    setState(() {
      _currentIndex = index;
      appBarTitle = tabData[index]['text'];
    });
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(tabData[_currentIndex]['text']),
      ),
      drawer: new MyDrawer(),
      body: IndexedStack(
        index: _currentIndex,
        children: _list,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _myTabs,
        //高亮  被点击高亮
        currentIndex: _currentIndex,
        //修改 页面
        onTap: _itemTapped,
        //shifting :按钮点击移动效果
        //fixed：固定
        type: BottomNavigationBarType.fixed,

        fixedColor: Theme.of(context).primaryColor,
      ),
    );
  }
}

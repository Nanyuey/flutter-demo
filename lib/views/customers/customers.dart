import 'package:flutter/material.dart';
import '../../components/InfiniteListView/list.dart';
import '../../components/InfiniteListView/customerItem.dart';
class CustomerPage extends StatefulWidget {
  _CustomerPageState createState()=>new _CustomerPageState();
}
class _CustomerPageState extends State<CustomerPage>{
  List customerList=[{'name':"##loading##"}];
  List  getList(){
   
     //表尾标记
    List _defaultList=[
        {'name': 'Navigation'},
        {'name': 'List'},
        {'name': 'Card'},
        {'name': 'Bar'},
        {'name': 'Dialog'},
        {'name': 'Scaffold'},
        {'name': 'Grid'},
        {'name': 'Scroll'},
        {'name': 'Tab'},
        {'name': 'Menu'},
        ];
    customerList.insertAll(customerList.length-1,_defaultList);
    return customerList;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("客户列表"),
        ),
        body:InfiniteListView(fn:getList,dom:CustomerItem())
        // body: Container(child: Text("CustomerPage"))
        );
  }
}
import 'package:flutter/material.dart';
import '../../components/InfiniteListView/list.dart';
import '../../components/InfiniteListView/customerItem.dart';
import '../../components/searchInput/index.dart';

class CustomerPage extends StatefulWidget {
  _CustomerPageState createState() => new _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  List customerList = [
    {'name': "##loading##"}
  ];
  List getList() {
    //表尾标记
    List _defaultList = [
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
    customerList.insertAll(customerList.length - 1, _defaultList);
    return customerList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        new SearchBar(),
        new Expanded(
          child: InfiniteListView(fn: getList, dom: CustomerItem()),
        )
      ],
    )
        // new SearchBar(),
        // InfiniteListView(fn: getList, dom: CustomerItem()),
        //  Column(
        //   children: <Widget>[
        //     new SearchBar(),
        //     Container(
        //       child: InfiniteListView(fn: getList, dom: CustomerItem()),
        //     )
        //   ],
        // )

        // body: Container(child: Text("CustomerPage"))
        );
  }
}

import 'package:flutter/material.dart';

class InfiniteListView extends StatefulWidget {
  Function fn;
  Widget dom;
  @override
  InfiniteListView({Key key, this.fn, this.dom}) : super(key: key);
  @override
  _InfiniteListViewState createState() => new _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {
  static const loadingTag = "##loading##"; //表尾标记
  var _words = <dynamic>[
    {'name': "##loading##"}
  ];
  List _list = [];
  String searchValue;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      setState(() {
        _words = widget.fn();
        print(_words);
      });
    });
    // _retrieveData();
  }

  // void searchValueChange(val) {
  //   setState() {
  //     if (_words.length > 0) {
  //       _list = _words;
  //       _words = _words.retainWhere((item) => item['name'].contains(val));
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    if (_words.length > 0) {
      return ListView.separated(
        itemCount: _words.length,
        itemBuilder: (context, index) {
          //如果到了表尾
          if (_words[index]['name'] == loadingTag) {
            //不足100条，继续获取数据
            if (_words.length - 1 < 30) {
              //获取数据
              Future.delayed(Duration(milliseconds: 200)).then((e) {
                setState(() {
                  _words = widget.fn();
                });
              });
              //加载时显示loading
              return Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: SizedBox(
                    width: 24.0,
                    height: 24.0,
                    child: CircularProgressIndicator(strokeWidth: 2.0)),
              );
            } else {
              //已经加载了100条数据，不再获取数据。
              return Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "没有更多了",
                    style: TextStyle(color: Colors.grey),
                  ));
            }
          }
          //显示单词列表项
          return ListTile(title: Text(_words[index]['name']));
        },
        separatorBuilder: (context, index) => Divider(height: .0),
      );
    } else {
      return Container();
    }
  }

  // void _retrieveData() {
  //   Future.delayed(Duration(seconds: 2)).then((e) {
  //     _words.insertAll(_words.length - 1,
  //         //每次生成20个单词
  //         generateWordPairs().take(20).map((e) => e.asPascalCase).toList()
  //     );
  //     setState(() {
  //       //重新构建列表
  //     });
  //   });
  // }

}

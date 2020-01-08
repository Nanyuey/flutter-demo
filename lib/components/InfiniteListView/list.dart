import 'package:flutter/material.dart';
class InfiniteListView extends StatefulWidget{
  Function fn;
  Widget dom;
  InfiniteListView({Key key, this.fn,this.dom}) : super(key: key);
    @override
  _InfiniteListViewState createState() => new _InfiniteListViewState();
}
class _InfiniteListViewState extends State<InfiniteListView> {
  static const loadingTag = "##loading##"; //表尾标记
  var _words = <dynamic>[loadingTag];
  @override
  void initState() {
    super.initState();
    setState(() {
       _words = widget.fn();
    });
    // _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _words.length,
      itemBuilder: (context, index) {
        print(_words[index]);
        //如果到了表尾
        if (_words[index]['name'] == loadingTag) {
          //不足100条，继续获取数据
          if (_words.length - 1 < 30) {
            //获取数据
            setState(() {
               _words= widget.fn();
            });
            //加载时显示loading
            return Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: CircularProgressIndicator(strokeWidth: 2.0)
              ),
            );
          } else {
            //已经加载了100条数据，不再获取数据。
            return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16.0),
                child: Text("没有更多了", style: TextStyle(color: Colors.grey),)
            );
          }
         
        }
        //显示单词列表项
        return ListTile(title: Text(_words[index]['name']));
      },
      separatorBuilder: (context, index) => Divider(height: .0),
    );
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
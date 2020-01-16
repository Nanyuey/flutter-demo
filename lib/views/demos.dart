import 'package:flutter/material.dart';

class GestureDetectorTestRoute extends StatefulWidget {
  @override
  _GestureDetectorTestRouteState createState() =>
      new _GestureDetectorTestRouteState();
}

class _GestureDetectorTestRouteState extends State<GestureDetectorTestRoute>
    with SingleTickerProviderStateMixin {
  double _top = 0; //距顶部的偏移
  double _left = 0; //距左边的偏移
  double _startX = 0;
  double _endX = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          child: GestureDetector(
            child: Container(
              color: Colors.blue,
              height: 50,
              width: MediaQuery.of(context).size.width,
            ),
            // child: CircleAvatar(child: Text("A")),
            //手指按下时会触发此回调
            onPanDown: (DragDownDetails e) {
              //打印手指按下的位置(相对于屏幕)
              print("用户手指按下：${e.globalPosition.dx}");
              setState(() {
                _startX = e.globalPosition.dx;
                _endX = e.globalPosition.dx;
              });
            },
            //手指滑动时会触发此回调
            onPanUpdate: (DragUpdateDetails e) {
              print(e.delta.dx);
              //用户手指滑动时，更新偏移，重新构建
              setState(() {
                _endX += e.delta.dx;
                // _left += e.delta.dx;
                // _top += e.delta.dy;
                // print(_endX);
              });
            },
            onPanEnd: (DragEndDetails e) {
              //打印滑动结束时在x、y轴上的速度
              print(e.velocity);
            },
          ),
        )
      ],
    );
  }
}

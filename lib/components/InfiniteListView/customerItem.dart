import 'package:flutter/material.dart';

class CustomerItem extends StatelessWidget{
  Map item={};
  CustomerItem({Key key, this.item}) : super(key: key);
  @override 
  Widget build(BuildContext context){
    return Padding(
       padding: EdgeInsets.all(10.0),
       child: Row(
         children: <Widget>[Text(item['name'])],
       ),
    );
 }
}
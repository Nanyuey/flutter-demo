import 'package:flutter/material.dart';

class SaveButton extends StatefulWidget {
  final Function fn;
  SaveButton({Key key, this.fn}) : super(key: key);
  @override
  _SaveButtonState createState() => new _SaveButtonState();
}

class _SaveButtonState extends State<SaveButton> {
  Widget build(BuildContext context) {
    return FlatButton(
      color: Theme.of(context).primaryColor,
      child: Text(
        "保存",
        style: TextStyle(color: Colors.white),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      padding: const EdgeInsets.only(left: 80, right: 80),
      onPressed: widget.fn,
    );
  }
}

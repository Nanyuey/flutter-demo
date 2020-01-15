import 'package:flutter/material.dart';

class MyRegister extends StatefulWidget {
  @override
  _MyRegisterState createState() => new _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  TextEditingController _rPwdController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();
  Widget buildForm() {
    return Form(
      key: _formKey, //设置globalKey，用于后面获取FormState
      autovalidate: true, //开启自动校验
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
              controller: _unameController,
              decoration:
                  InputDecoration(hintText: "请输入账号", icon: Icon(Icons.person)),
              // 校验用户名
              validator: (v) {
                return v.trim().length > 0 ? null : "账号不能为空";
              }),
          TextFormField(
              controller: _pwdController,
              decoration:
                  InputDecoration(hintText: "请输入密码", icon: Icon(Icons.lock)),
              //校验密码
              validator: (v) {
                return v.trim().length > 5 ? null : "密码不能少于6位";
              }),
          TextFormField(
              controller: _rPwdController,
              decoration:
                  InputDecoration(hintText: "请再次输入密码", icon: Icon(Icons.lock)),
              //校验密码
              validator: (v) {
                return v.trim().length > 5
                    ? v.trim() != _pwdController.text ? '两次密码输入不一致' : null
                    : "密码不能少于6位";
              }),
          // 登录按钮
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: RaisedButton(
                    padding: EdgeInsets.only(
                        top: 8.0, left: 30.0, bottom: 8.0, right: 30.0),
                    child: Text("注册"),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    onPressed: () {
                      //在这里不能通过此方式获取FormState，context不对
                      //print(Form.of(context));

                      // 通过_formKey.currentState 获取FormState后，
                      // 调用validate()方法校验用户名密码是否合法，校验
                      // 通过后再提交数据。
                      if ((_formKey.currentState as FormState).validate()) {
                        //验证通过提交数据
                      }
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("注册"),
        // ),
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Color(0xFFC91B3A),
      child: Center(
        child: Container(
            width: MediaQuery.of(context).size.width * 0.85,
            child: Container(
              height: 300,
              child: buildForm(),
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8.0)))),
      ),
    ));
  }
}

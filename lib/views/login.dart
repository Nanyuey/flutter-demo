import 'package:flutter/material.dart';
// import 'package:flu_demo/utils/data_util.dart';
import 'package:provider/provider.dart';
import 'package:store/model/user.dart';
import 'package:store/routes/application.dart';
import 'package:fluro/fluro.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  GlobalKey<FormState> _signInFormKey = new GlobalKey();
  String _name;
  String _password;

  Widget buildSignInTextForm() {
    return Container(
      constraints: BoxConstraints.tightFor(width: 400.0), //卡大小
      decoration: BoxDecoration(//背景装饰
      border: Border.all(width: 0.5,color: Colors.black12),
    borderRadius: BorderRadius.circular(3.0), //3像素圆角
  ),
  child:Form(
        key: _signInFormKey,
        autovalidate: true,
        child: Column(
          children: <Widget>[
            TextFormField(
                autofocus: true,
                controller: _unameController,
                onSaved: (val) => this._name = val,
                decoration: InputDecoration(
                  hintText: "用户名或邮箱",
                  prefixIcon: Icon(Icons.person),
                ),
                // 校验用户名（不能为空）
                validator: (v) {
                  // return v.trim().isNotEmpty ? null : '请输入用户名';
                }),
            TextFormField(
                controller: _pwdController,
                onSaved: (val) => this._password = val,
                decoration: InputDecoration(
                    hintText: "您的登录密码",
                    prefixIcon: Icon(Icons.lock)),
                obscureText: true,
                //校验密码
                validator: (v) {
                  // return v.trim().length > 5 ? null : "密码不能少于6位";
                }),
          ],
        ),
      ),
    );
  }

  void toHome(userInfo, data, context) {
    userInfo.setName(data['userName']);
    Application.router
        .navigateTo(context, '/home', transition: TransitionType.fadeIn);
  }

  Widget buildSignInButton(userInfo, context) {
    return Container(
        margin: EdgeInsets.only(top: 20.0), //容器外填充
        child: GestureDetector(
      child: Container(
        padding: EdgeInsets.only(left: 80, right: 80, top: 8, bottom: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Theme.of(context).primaryColor),
        child: Text(
          "登录",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
      onTap: () {
        // 利用key来获取widget的状态FormState,可以用过FormState对Form的子孙FromField进行统一的操作
        if (_signInFormKey.currentState.validate()) {
          _signInFormKey.currentState.save();
          // DataUtils.doLogin({
          //   'accountNo': this._name,
          //   'password': this._password,
          //   'platformId': 1001
          // }).then((data) => this.toHome(userInfo, data, context));
          // 如果输入都检验通过，则进行登录操作
          // Scaffold.of(context)
          //     .showSnackBar(new SnackBar(content: new Text("执行登录操作")));
          //调用所有自孩子��save回调，保存表单内容
          // DataUtils.doLogin()
        }
      },
    )
    );
  
  }

  // Widget buildButton(context) {
  //   return RaisedButton(
  //       child: Text("normal"),
  //       onPressed: () => Application.router.navigateTo(context, '/testPage',
  //           transition: TransitionType.fadeIn));
  // }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(title: Text('登录')),
        body: Consumer<UserModel>(
          builder: (context, UserModel userInfo, _) =>Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               
               Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 100),
                 child:  Text('你来啦~,登录吧',
              style: TextStyle(
                      color: Colors.black87,
                      fontSize: 24.0,
                      height: 1.2,  
                    )
              )
              ),
              buildSignInTextForm(),
              // FlatButton(
              //      child: Text("normal"),
 
              // )
              buildSignInButton(userInfo, context)
            ],
          ),
             ],
          ) 
        ));
  }
}

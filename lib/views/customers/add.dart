import 'package:flutter/material.dart';
import 'package:store/routes/application.dart';
import 'package:store/routes/routes.dart';
import 'package:city_pickers/city_pickers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/components/button/saveButton.dart';

class CustomerAdd extends StatefulWidget {
  @override
  _CustomerAddState createState() => new _CustomerAddState();
}

class _CustomerAddState extends State<CustomerAdd> {
  Result resultArr = new Result();
  void goBack() {
    Application.router.navigateTo(context, Routes.home);
  }

  void onSelectClick() {
    showCityPicker();
  }

  void save() {
    print('click save');
  }

  void showCityPicker() async {
    Result tempResult = await CityPickers.showCityPicker(
      context: context,
      locationCode: resultArr != null
          ? resultArr.areaId ?? resultArr.cityId ?? resultArr.provinceId
          : null,
      cancelWidget: Text(
        '取消',
        style: TextStyle(
            fontSize: ScreenUtil().setSp(26), color: Color(0xff999999)),
      ),
      confirmWidget: Text(
        '确定',
        style: TextStyle(
            fontSize: ScreenUtil().setSp(26), color: Color(0xfffe1314)),
      ),
    );

    if (tempResult != null) {
      setState(() {
        resultArr = tempResult;
      });
    }
    setState(() {
      print(tempResult.toString());
      _addressResultCh = "${tempResult.provinceName}-${tempResult.cityName}" +
              tempResult.areaName ??
          "-" + tempResult.areaName;
    });
  }

  CityPickerUtil cityPickerUtils = CityPickers.utils();
  String _addressResult;
  String _addressResultCh = '请选择省市';
  GlobalKey _customerFormKey = new GlobalKey<FormState>();
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  Widget CustomerForm() {
    return Container(
      child: Form(
        key: _customerFormKey,
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              height: 50,
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1, color: Colors.black12))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 90,
                    child: Row(
                      children: <Widget>[
                        Text(
                          '客户名',
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          '必填',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _unameController,
                      decoration: InputDecoration(
                          hintText: "请输入客户真实姓名or微信昵称",
                          border: InputBorder.none),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(width: 1, color: Colors.black12))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 90,
                          child: Text(
                            '姓名',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: _unameController,
                            decoration: InputDecoration(
                                hintText: "请输入收件人姓名", border: InputBorder.none),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(width: 1, color: Colors.black12))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 90,
                          child: Text(
                            '联系电话',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: _unameController,
                            decoration: InputDecoration(
                                hintText: "请输入手机号码", border: InputBorder.none),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 1, color: Colors.black12))),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: 90,
                                child: Text(
                                  '地址',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              Expanded(
                                  child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    child: Text(_addressResultCh),
                                  ),
                                  GestureDetector(
                                    child: Icon(Icons.keyboard_arrow_right),
                                    onTap: onSelectClick,
                                  )
                                ],
                              ))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(width: 90),
                              Expanded(
                                child: TextField(
                                  minLines: 3,
                                  maxLines: 5,
                                  decoration: InputDecoration(
                                      hintText: "请填写详细地址",
                                      border: InputBorder.none),
                                ),
                              )
                            ],
                          )
                        ],
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('新建客户'),
        leading: new IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: goBack,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CustomerForm(),
          SaveButton(fn: save)
          // Positioned(
          //   bottom: 10,
          //   child: SaveButton(fn: save),
          // )
        ],
      ),
    );
  }
}

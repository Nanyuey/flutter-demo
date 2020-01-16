import 'package:flutter/material.dart';
import 'routes/routes.dart';
import 'package:fluro/fluro.dart';
import 'routes/application.dart' show Application;
import 'package:store/views/home.dart';
import 'package:store/views/login.dart';
import 'package:provider/provider.dart';
import './model/user.dart';
import 'package:store/views/register.dart';
import 'package:store/views/demos.dart';

void main() {
  final userInfo = UserModel();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(value: userInfo),
  ], child: new MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp() {
    final router = new Router();
    Routes.configureRoutes(router);
    // 这里设置项目环境
    Application.router = router;
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int themeColor = 0xFFC91B3A;
  bool _isLoading = true;
  bool _hasLogin = false;
  showWelcomePage() {
    return GestureDetectorTestRoute();
    // return LoginPage();
    // return LoginPage();
    // return MyAppPage();
    // if (_isLoading) {
    //   return Container(
    //     color: Color(this.themeColor),
    //     child: Center(
    //       child: SpinKitPouringHourglass(color: Colors.white),
    //     ),
    //   );
    // } else {
    //   // 判断是否已经登录
    //   if (_hasLogin) {
    //     return MyAppPage();
    //   } else {
    //     return LoginPage();
    //   }
    // }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
//    WidgetTree.getCommonItemByPath([15, 17], Application.widgetTree);
    return new MaterialApp(
      title: 'titles',
      theme: new ThemeData(
        primaryColor: Color(this.themeColor),
        backgroundColor: Color(0xFFEFEFEF),
        accentColor: Color(0xFF888888),
        textTheme: TextTheme(
          //设置Material的默认字体样式
          body1: TextStyle(color: Color(0xFF888888), fontSize: 16.0),
        ),
        iconTheme: IconThemeData(
          color: Color(this.themeColor),
          size: 35.0,
        ),
      ),
      home: new Scaffold(body: showWelcomePage()),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Application.router.generator,
      // navigatorObservers: <NavigatorObserver>[Analytics.observer],
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.display1,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

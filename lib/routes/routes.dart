import 'package:fluro/fluro.dart';
import './route_handle.dart';

class Routes {
  static Router router;
  static String root = "/";
  static String login = '/login';
  static String home = "/home";
  static String register = '/register';
  static String customerAdd = '/customerAdd';
  static String goodsAdd = '/goodsAdd';
  static String orderAdd = '/orderAdd';
  static void configureRoutes(Router router) {
    router.define(home, handler: homeHandler);
    router.define(login, handler: loginHandler);
    router.define(register, handler: registerHandler);
    router.define(customerAdd, handler: customersAddHandler);
    router.define(goodsAdd, handler: goodsAddHandler);
    router.define(orderAdd, handler: orderAddHandler);
  }
}

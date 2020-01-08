import 'package:fluro/fluro.dart';
import './route_handle.dart';

class Routes {
  static Router router;
  static String root = "/";
  static String login = '/login';
  static String home = "/home";
  static void configureRoutes(Router router) {
    router.define(home, handler: homeHandler);
    router.define(login, handler: loginHandler);
  }
}

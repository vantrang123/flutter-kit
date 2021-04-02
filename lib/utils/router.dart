import 'package:flutter/material.dart';
import 'package:starterkit/views/auth/login.dart';
import 'package:starterkit/views/home/home_screen.dart';
import 'package:starterkit/views/main/main_screen.dart';
import 'package:starterkit/views/movies/index.dart';
import 'package:starterkit/views/pages/about.dart';
import 'package:starterkit/views/pages/dashboard.dart';
import 'package:starterkit/views/pages/flutter_tips.dart';
import 'package:starterkit/views/pages/rate_app.dart';
import 'package:starterkit/views/pages/refer_a_friend.dart';
import 'package:starterkit/views/pages/splash_page.dart';

import '../views/auth/login.dart';
import '../views/pages/about.dart';
import '../views/pages/flutter_tips.dart';
import '../views/pages/rate_app.dart';
import 'constants.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Constants.splash:
        return MaterialPageRoute(builder: (_) => SplashScreenPage());
      case Constants.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Constants.main:
        return MaterialPageRoute(builder: (_) => MainScreen());
      case Constants.referAFriend:
        return MaterialPageRoute(builder: (_) => ReferAFriendPage());
      case Constants.about:
        return MaterialPageRoute(builder: (_) => AboutPage());
      case Constants.rateApp:
        return MaterialPageRoute(builder: (_) => RateApp());
      case Constants.flutterTips:
        return MaterialPageRoute(builder: (_) => FlutterTipsPage());
      case Constants.login:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case Constants.dashboard:
        return MaterialPageRoute(builder: (_) => DashboardPage());
      case Constants.moviesIndex:
        return MaterialPageRoute(builder: (_) => MoviesIndexPage());
    }
  }
}

class EnterExitRoute extends PageRouteBuilder {
  final Widget enterPage;
  final Widget exitPage;
  EnterExitRoute({this.exitPage, this.enterPage})
      : super(
    transitionDuration: Duration(milliseconds: 300),
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    enterPage,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        Stack(
          children: <Widget>[
            SlideTransition(
              position: new Tween<Offset>(
                begin: const Offset(0.0, 0.0),
                end: const Offset(-1.0, 0.0),
              ).animate(animation),
              child: exitPage,
            ),
            SlideTransition(
              position: new Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: enterPage,
            )
          ],
        ),
  );
}

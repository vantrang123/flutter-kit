import 'package:flutter/material.dart';
import 'package:starterkit/views/auth/login.dart';
import 'package:starterkit/views/movies/index.dart';
import 'package:starterkit/views/pages/about.dart';
import 'package:starterkit/views/pages/dashboard.dart';
import 'package:starterkit/views/pages/flutter_tips.dart';
import 'package:starterkit/views/pages/home.dart';
import 'package:starterkit/views/pages/rate_app.dart';
import 'package:starterkit/views/pages/refer_a_friend.dart';
import 'package:starterkit/views/pages/splash_page.dart';
import 'package:starterkit/views/pages/unknown_page.dart';

import '../views/auth/login.dart';
import '../views/pages/about.dart';
import '../views/pages/flutter_tips.dart';
import '../views/pages/home.dart';
import '../views/pages/rate_app.dart';
import 'constants.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Constants.splash:
        return MaterialPageRoute(builder: (_) => SplashScreenPage());
      case Constants.home:
        return MaterialPageRoute(builder: (_) => HomePage());
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
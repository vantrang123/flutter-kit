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
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Constants.splash:
        return MaterialPageRoute(builder: (context) => SplashScreenPage());
      case Constants.home:
        return MaterialPageRoute(builder: (context) => HomePage());
      case Constants.referAFriendPage:
        return MaterialPageRoute(builder: (context) => ReferAFriendPage());
      case Constants.aboutPage:
        return MaterialPageRoute(builder: (context) => AboutPage());
      case Constants.rateApp:
        return MaterialPageRoute(builder: (context) => RateApp());
      case Constants.flutterTipsPage:
        return MaterialPageRoute(builder: (context) => FlutterTipsPage());
      case Constants.loginPage:
        return MaterialPageRoute(builder: (context) => LoginPage());
      case Constants.dashboardPage:
        return MaterialPageRoute(builder: (context) => DashboardPage());
      case Constants.moviesIndexPage:
        return MaterialPageRoute(builder: (context) => MoviesIndexPage());
      default:
        return MaterialPageRoute(builder: (context) => UnknownPage(),);
    }
  }
}
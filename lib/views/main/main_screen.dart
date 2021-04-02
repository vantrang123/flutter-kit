import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:starterkit/localization/app_localizations.dart';
import 'package:starterkit/theme/colors.dart';
import 'package:starterkit/views/home/home_screen.dart';
import 'package:starterkit/views/pages/flutter_tips.dart';
import 'package:starterkit/views/pages/home.dart';
import 'package:starterkit/views/pages/refer_a_friend.dart';

import 'main_constants.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key key}) : super(key: key);

  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  List<Widget> _listScreens = [
    HomeScreen(),
    FlutterTipsPage(),
    HomePage(),
    ReferAFriendPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _listScreens,
        ),
        bottomNavigationBar: buildBottomBar());
  }

  Widget buildBottomBar() {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        items: getListBottomBarItems(),
        currentIndex: _selectedIndex,
        selectedItemColor: appPrimaryColor,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        onTap: _onItemTapped);
  }

  List<BottomNavigationBarItem> getListBottomBarItems() {
    return [
      BottomNavigationBarItem(
          icon: Icon(EvaIcons.home),
          label: buildText(context, HomeConstants.home)),
      BottomNavigationBarItem(
          icon: Icon(EvaIcons.heart),
          label: buildText(context, HomeConstants.wish_list)),
      BottomNavigationBarItem(
          icon: Icon(EvaIcons.shoppingCart),
          label: buildText(context, HomeConstants.cart)),
      BottomNavigationBarItem(
          icon: Icon(EvaIcons.person),
          label: buildText(context, HomeConstants.account)),
    ];
  }
}
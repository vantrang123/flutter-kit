import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:starterkit/localization/app_localizations.dart';
import 'package:starterkit/utils/colors.dart';
import 'package:starterkit/views/movies/index.dart';
import 'package:starterkit/views/pages/flutter_tips.dart';
import 'package:starterkit/views/pages/home.dart';
import 'package:starterkit/views/pages/refer_a_friend.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: AppColors.appPrimaryColor);

  List<Widget> _listScreens = [
    HomePage(),
    FlutterTipsPage(),
    MoviesIndexPage(),
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
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: buildText(context, 'home') ?? ""
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_sharp),
              label: buildText(context, 'wish_list') ?? ""
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: buildText(context, 'cart') ?? ""
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: buildText(context, 'account') ?? ""
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: AppColors.appPrimaryColor,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          onTap: _onItemTapped),
    );
  }
}

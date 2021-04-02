import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:starterkit/theme/colors.dart';

import 'home_body.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: backgroundColor, body: HomeBody());
  }
}
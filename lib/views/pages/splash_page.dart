import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:starterkit/local/Prefs.dart';
import 'package:starterkit/theme/colors.dart';
import 'package:starterkit/utils/constants.dart';
import 'package:starterkit/utils/styles.dart';
import 'package:starterkit/views/main/main_screen.dart';

import 'intro_screen.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  Prefs localStorageEx = Prefs();
  Future checkFirstSeen() async {
    bool _seen = localStorageEx.getRunKey() ?? false;

    if (_seen) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => MainScreen()
        )
      );
    } else {
      localStorageEx.setRunKey(true);
      Navigator.of(context).pushReplacement(
        new MaterialPageRoute(
          builder: (context) => new IntroScreenPage()
        )
      );
    }
  }

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () {
        checkFirstSeen();
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
//      decoration: BoxDecoration(
//        image: DecorationImage(
//          image: AssetImage('assets/images/football-boy.jpg'),
//          fit: BoxFit.cover,
//        ),
//      ),
      color: appPrimaryColor,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.transparent,
          ),
          child: ListView(
            children: <Widget>[
              SizedBox(height: 150.0,),
              Center(
                child: Text(Constants.appName,
                  style: Styles.h1_white.copyWith(
                    fontSize: 45,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(45,5,45,5),
                child: Divider(color: Colors.grey[300],),
              ),

              Text(Constants.appTagLine,
                style: Styles.p_white.copyWith(
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 30.0,),
              Container(
                padding: EdgeInsets.all(20),
                height: 250,
                child: Image.asset('assets/images/rikai_brand.png'),
              ),
              SizedBox(height: 10.0,),
            ],
          ),
        ),
      ),
    );
  }

}

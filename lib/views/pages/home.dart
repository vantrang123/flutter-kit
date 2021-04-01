import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:starterkit/localization/app_localizations.dart';
import 'package:starterkit/utils/constants.dart';
import 'package:starterkit/utils/router.dart';
import 'package:starterkit/utils/styles.dart';
import 'package:starterkit/views/movies/index.dart';
import 'package:starterkit/views/partials/common_appbar_actions.dart';
import 'package:starterkit/views/partials/custom_form_fields.dart';
import 'package:starterkit/views/partials/drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.appName),
        actions: CommonAppBarActions(),
      ),
      drawer: HomeDrawer(),
      body: Container(
        padding: EdgeInsets.all(Constants.commonPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              buildText(context, 'you_have_pushed'),
              style: Styles.p,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),

            SizedBox(height: 20,),

            Text("Native Ad",
              style: Styles.h1.copyWith(
                height: 1.5,
              )
            ),

            SizedBox(height: 10,),

            // buildNativeAd(),

            SizedBox(height: 20,),

            MySubmitIconedThemedButton(
              context, buildText(context, 'go_to_movies'),
              Icon(MdiIcons.viewList),
              true,
              () {
                Navigator.push(context, EnterExitRoute(exitPage: HomePage(), enterPage: MoviesIndexPage()));
              }
            )
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

}

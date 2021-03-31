import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'utils/constants.dart';
import 'utils/flavor.dart';
import 'utils/router.dart' as router;
import 'utils/styles.dart';
import 'views/pages/unknown_page.dart';

void main() {
  final flavor = EnumToString.fromString(
    Flavor.values,
    const String.fromEnvironment('FLAVOR'),
  );
  if (flavor.index == 0)
    Constants.apiBaseUrl = Constants.apiBaseUrlDev;
  else if (flavor.index == 1)
    Constants.apiBaseUrl = Constants.apiBaseUrlStaging;
  else
    Constants.apiBaseUrl = Constants.apiBaseUrlPro;
  print('FLAVOR $flavor ${Constants.apiBaseUrl}');
  runApp(MultiProvider(
    providers: [Provider.value(value: flavor)],
    child: App(),
  ));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Define the default brightness and colors
        // brightness: Brightness.dark,
        primaryColor: Styles.appPrimaryColor,
        accentColor: Styles.appAccentColor,
        brightness: Brightness.light,

        // for drawer color
        canvasColor: Styles.appCanvasColor,

        // Define the default font family.
        fontFamily: 'Montserrat',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: Styles.appTextTheme,
      ),
      initialRoute: Constants.splash,
      onGenerateRoute: router.Router.generateRoute,
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) => UnknownPage(),
        );
      },
    );
  }
}

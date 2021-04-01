import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:starterkit/local/Prefs.dart';
import 'package:starterkit/localization/app_localizations.dart';
import 'package:starterkit/localization/language_constants.dart';
import 'package:starterkit/utils/colors.dart';
import 'package:starterkit/utils/constants.dart';
import 'package:starterkit/utils/styles.dart';
import 'package:starterkit/utils/router.dart' as router;

import 'pages/unknown_page.dart';

class App extends StatefulWidget {
  static void setLocale(BuildContext context, Locale newLocale) async {
    _AppState state = context.findAncestorStateOfType<_AppState>();
    state.setLocale(newLocale);
  }

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  Locale _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    this._fetchLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    /*if (this._locale == null) {
      print(('XXXXXXXXXXXXXXXX'));
      return Container(
        child: Center(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[800])),
        ),
      );
    } else*/
      return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.appPrimaryColor,
          accentColor: AppColors.appAccentColor,
          brightness: Brightness.light,

          // for drawer color
          canvasColor: AppColors.appCanvasColor,
          fontFamily: 'Montserrat',
          textTheme: Styles.appTextTheme,
        ),
        supportedLocales: [
          Locale('en', 'US'),
          Locale('vi', 'VN'),
        ],
        locale: _locale,
        localizationsDelegates: [
          AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode &&
                supportedLocale.countryCode == locale.countryCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
        initialRoute: Constants.splash,
        onGenerateRoute: router.Router.generateRoute,
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            builder: (_) => UnknownPage(),
          );
        },
      );
  }

  _fetchLocale() async {
    Locale tempLocale;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String languageCode = (prefs.getString(LAGUAGE_CODE) ?? 'en');

    switch (languageCode) {
      case ENGLISH:
        tempLocale = Locale(ENGLISH, 'US');
        break;
      case VIETNAMESE:
        tempLocale = Locale(VIETNAMESE, 'VN');
        break;
      default:
        tempLocale = Locale(ENGLISH, 'US');
    }
    return tempLocale;
  }
}

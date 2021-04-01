import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:starterkit/local/Prefs.dart';
import 'package:starterkit/localization/app_localizations.dart';
import 'package:starterkit/localization/language_constants.dart';
import 'package:starterkit/utils/constants.dart';
import 'package:starterkit/utils/styles.dart';
import 'package:starterkit/views/app.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeaderItem(),
          FlutterTipsItem(),
          Divider(
            color: Colors.grey[500],
          ),
          LoginItem(),
          ReferAFriendItem(),
          AboutItem(),
          RateAppItem(),
          ChangeLanguage(),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}

class BackendDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeaderItem(),
          Divider(
            color: Colors.grey[500],
          ),
          LogoutItem(),
          ReferAFriendItem(),
          AboutItem(),
          RateAppItem(),
          ChangeLanguage(),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}

/// menu header
class DrawerHeaderItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
//      child: Text("Menu",
//        style: TextStyle(
//          fontSize: 20.0,
//          color: Colors.white,
//        ),
//      ),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        image: DecorationImage(
            image: AssetImage(Constants.logoKey), fit: BoxFit.contain),
      ),
    );
  }
}

/// home item
class HomeItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Home", style: Styles.appDrawerTextStyle),
      leading: Icon(Icons.lightbulb_outline, color: Styles.appDrawerIconColor),
      onTap: () {
        Navigator.pop(context);

        Navigator.pushNamed(context, '/');
      },
    );
  }
}

/// flutter tips item
class FlutterTipsItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Flutter Tips", style: Styles.appDrawerTextStyle),
      leading: Icon(Icons.lightbulb_outline, color: Styles.appDrawerIconColor),
      onTap: () {
        Navigator.pop(context);

        Navigator.pushNamed(context, Constants.flutterTips);
      },
    );
  }
}

/// refer a friend item
class ReferAFriendItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Refer a Friend", style: Styles.appDrawerTextStyle),
      leading: Icon(Icons.share, color: Styles.appDrawerIconColor),
      onTap: () {
        Navigator.pop(context);

        Navigator.pushNamed(context, Constants.referAFriend);
      },
    );
  }
}

/// logout item
class LogoutItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Logout", style: Styles.appDrawerTextStyle),
      leading: Icon(Icons.exit_to_app, color: Styles.appDrawerIconColor),
      onTap: () {
//        AuthProvider().logout();

//        Navigator.pop(context);
//        Navigator.pop(context);

        Navigator.pushNamed(context, '/');
      },
    );
  }
}

/// change language
class ChangeLanguage extends StatelessWidget {
  Prefs localStorageEx = Prefs();
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        buildTranslate(context, 'change_language'),
      ),
      leading: Icon(Icons.language, color: Styles.appDrawerIconColor),
      onTap: () async {
        String _languageCode = localStorageEx.getLanguage();
        if (_languageCode == "en") _changeLanguage(VIETNAMESE, context);
        else _changeLanguage(ENGLISH, context);
        // Navigator.pop(context);
      },
    );
  }

  void _changeLanguage(String languageCode, BuildContext context) async {
    localStorageEx.setLanguage(languageCode);
    Locale locale;
    switch (languageCode) {
      case ENGLISH:
        locale = Locale(languageCode, 'US');
        break;
      case VIETNAMESE:
        locale = Locale(languageCode, 'VN');
    }
    App.setLocale(context, locale);
  }
}

/// login item
class LoginItem extends StatefulWidget {
  @override
  _LoginItemState createState() => _LoginItemState();
}

class _LoginItemState extends State<LoginItem> {
  bool loggedIn = false;

  void _checkStatus() async {
//    bool isLoggedIn = await AuthProvider().checkIfAuth();
//    setState(() {
//      loggedIn = isLoggedIn;
//    });
  }

  @override
  void initState() {
    _checkStatus();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return loggedIn
        ? ListTile(
            title: Text("Dashboard", style: Styles.appDrawerTextStyle),
            leading: Icon(Icons.home, color: Styles.appDrawerIconColor),
            onTap: () {
              Navigator.pop(context);

              Navigator.pushNamed(context, Constants.dashboard);
            },
          )
        : ListTile(
            title: Text(buildTranslate(context, 'sign_in'), style: Styles.appDrawerTextStyle),
            leading: Icon(Icons.exit_to_app, color: Styles.appDrawerIconColor),
            onTap: () {
              Navigator.pop(context);

              Navigator.pushNamed(context, Constants.login);
            },
          );
  }
}

/// about item
class AboutItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("About", style: Styles.appDrawerTextStyle),
      leading: Icon(Icons.info_outline, color: Styles.appDrawerIconColor),
      onTap: () {
        Navigator.pop(context);

        Navigator.pushNamed(context, Constants.about);
      },
    );
  }
}

/// rate app item
class RateAppItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(buildTranslate(context, 'rate_us'), style: Styles.appDrawerTextStyle),
      leading: Icon(Icons.star, color: Styles.appDrawerIconColor),
      onTap: () {
        Navigator.pop(context);

        Navigator.pushNamed(context, Constants.rateApp);
      },
    );
  }
}

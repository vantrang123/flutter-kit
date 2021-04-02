import 'package:flutter/material.dart';
import 'package:starterkit/utils/styles.dart';

import 'colors.dart';

final ThemeData defaultTheme = ThemeData(
  primarySwatch: Colors.blue,
  primaryColor: appPrimaryColor,
  accentColor: appAccentColor,
  brightness: Brightness.light,
  textTheme: Styles.appTextTheme,
  scaffoldBackgroundColor: backgroundColor,
  fontFamily: 'Muli',
  appBarTheme: AppBarTheme(
    color: backgroundColor,
    iconTheme: IconThemeData(color: accentLightColor),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: accentLightColor,
    disabledColor: primaryColorDark,
  ),
);
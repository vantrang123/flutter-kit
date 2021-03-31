import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'utils/constants.dart';
import 'utils/flavor.dart';
import 'views/app.dart';

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

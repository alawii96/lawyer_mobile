import 'package:flutter/foundation.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class AppData with ChangeNotifier {
  // ignore: prefer_final_fields
  Locale _currentLocale = Locale("en");

  Locale get locale => _currentLocale;

  void switchLocale() {
    _currentLocale.languageCode == "en"
        ? _currentLocale = Locale("ar")
        : _currentLocale = Locale("en");
    print("ok");
    notifyListeners();
  }
}

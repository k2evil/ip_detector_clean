import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  bool darkMode = true;
  Locale locale = const Locale("en");

  void switchDarkMode() {
    darkMode = !darkMode;
    notifyListeners();
  }

  void switchLocale() {
    locale =
        locale.languageCode == "en" ? const Locale("fa") : const Locale("en");
    notifyListeners();
  }
}
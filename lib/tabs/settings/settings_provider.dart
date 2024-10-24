import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  String languageCode = 'en';

  SettingsProvider() {
    _loadPreferences(); // Load preferences on initialization
  }

  String get backgroundImageName => isDark ? 'dark_bg' : 'lightbackground';

  String get sebhaLogo =>
      themeMode == ThemeMode.light ? 'sebhalogo' : 'dark_sebha';

  bool get isDark => themeMode == ThemeMode.dark;

  Future<void> _loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Load theme mode
    String? themePref = prefs.getString('themeMode');
    themeMode = (themePref == 'dark') ? ThemeMode.dark : ThemeMode.light;

    // Load language code
    languageCode = prefs.getString('languageCode') ?? 'en';

    notifyListeners();
  }

  void changeTheme(ThemeMode selectedTheme) async {
    themeMode = selectedTheme;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        'themeMode', selectedTheme == ThemeMode.dark ? 'dark' : 'light');
    notifyListeners();
  }

  void changeLanguage(String selectedLanguage) async {
    if (selectedLanguage == languageCode) return;
    languageCode = selectedLanguage;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('languageCode', selectedLanguage);
    notifyListeners();
  }
}

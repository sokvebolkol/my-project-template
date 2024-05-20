import 'package:orienda_agent/localization/language.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageLogic extends ChangeNotifier {

  Language _language = Language();
  Language get language => _language;

  int _index = 0;

  Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    _index = prefs.getInt('languageIndex') ?? 0;
    _language = languageList[_index];
  }

  Future<void> toggleLanguage() async {
    _index++;
    if (_index >= languageList.length) _index = 0;

    _language = languageList[_index];
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('languageIndex', _index);
  }
}


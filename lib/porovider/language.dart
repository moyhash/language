import 'package:flutter/material.dart';
import '../main.dart';

class Language extends ChangeNotifier {
  String _lang = language;

  getLanguage() {
    return _lang;
  }

  setLanguage(String lang) {
    _lang = lang;
    notifyListeners();
  }

  String tSetting() {
    if (getLanguage() == 'FR') {
      return 'Parametres';
    } else if (getLanguage() == 'EN') {
      return 'Settings';
    } else {
      return 'Avarlar';
    }
  }

  tChangeLanguage(){
    if (getLanguage() == 'FR') {
      return 'Changer la langue';
    } else if (getLanguage() == 'EN') {
      return 'Change Language';
    } else {
      return 'Dili degidytr';
    }
  }
}

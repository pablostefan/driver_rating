import 'dart:io';

import 'package:module_commons/commons.dart';
import 'package:module_commons/i18n/strings/en_us.dart';
import 'package:module_commons/i18n/strings/pt_br.dart';

abstract class TranslateCommons {
  static CommonsStrings strings = _getType();

  static T _getType<T extends CommonsStrings>() {
    switch (Platform.localeName) {
      case DriverRatingConstants.ptBR:
        return CommonsPtBR() as T;
      default:
        return CommonsEnUS() as T;
    }
  }
}

abstract class CommonsStrings {
  String get requestError;
}

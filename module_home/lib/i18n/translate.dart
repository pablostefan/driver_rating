import 'dart:io';

import 'package:module_commons/commons.dart';
import 'package:module_home/i18n/strings/en_us.dart';
import 'package:module_home/i18n/strings/pt_br.dart';

abstract class TranslateHome {
  static HomeStrings strings = _getType();

  static T _getType<T extends HomeStrings>() {
    switch (Platform.localeName) {
      case DriverRatingConstants.ptBR:
        return HomePtBR() as T;
      default:
        return HomeEnUS() as T;
    }
  }
}

abstract class HomeStrings {
  String get home;

  String get search;

  String get rate;

  String get ratings;

  String get history;

  String get reviews;

  String get yourReviews;

  String get driverRating;

  String get rateDriver;

  String get ratingSummary;

  String get score;

  String get review;

  String get successRateDriver;
}

import 'package:flutter/material.dart';
import 'package:module_commons/commons.dart';
import 'package:module_home/i18n/translate.dart';

class DiverRatingHomeAppBarWidget extends AppBar {
  static TextStyle get _textStyle => const TextStyle(color: DriverRatingColors.monoWhite);

  DiverRatingHomeAppBarWidget({super.key})
      : super(
            backgroundColor: DriverRatingColors.monoBlack,
            title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Padding(
                  padding: EdgeInsets.only(right: DriverRatingDimens.nano),
                  child: Icon(Icons.star, color: DriverRatingColors.gold, size: DriverRatingDimens.xxs)),
              Text(TranslateHome.strings.driverRating).bodyLargeSemiBold(style: _textStyle),
              const Padding(
                  padding: EdgeInsets.only(left: DriverRatingDimens.nano),
                  child: Icon(Icons.star, color: DriverRatingColors.gold, size: DriverRatingDimens.xxs)),
            ]));
}

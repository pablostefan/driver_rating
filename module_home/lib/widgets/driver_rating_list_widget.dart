import 'package:flutter/material.dart';
import 'package:module_commons/commons.dart';
import 'package:module_core/entities/driver.dart';
import 'package:module_home/i18n/translate.dart';
import 'package:module_home/widgets/driver_rating_card_widget.dart';

class DriverRatingListWidget extends StatelessWidget {
  final Driver driver;

  const DriverRatingListWidget({super.key, required this.driver});

  TextStyle get _goldTextStyle => const TextStyle(color: DriverRatingColors.gold);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(DriverRatingDimens.micro),
        padding: const EdgeInsets.all(DriverRatingDimens.micro),
        decoration: BoxDecoration(
            color: DriverRatingColors.graySevenHundred, borderRadius: BorderRadius.circular(DriverRatingDimens.xxxs)),
        child: Column(children: [
          Text(TranslateHome.strings.ratings).bodyMediumMedium(style: _goldTextStyle),
          ListBody(children: driver.ratings.map((rating) => DiverRatingCardWidget(rating: rating)).toList())
        ]));
  }
}

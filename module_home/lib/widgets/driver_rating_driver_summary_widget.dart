import 'package:flutter/material.dart';
import 'package:module_commons/commons.dart';
import 'package:module_core/entities/driver.dart';
import 'package:module_home/i18n/translate.dart';
import 'package:module_home/widgets/driver_rating_summary_widget/driver_rating_summary_widget.dart';

class DriverRatingSummaryWidget extends StatelessWidget {
  final Driver driver;

  const DriverRatingSummaryWidget({super.key, required this.driver});

  String get _package => "module_assets";

  TextStyle get _monoWhiteTextStyle => const TextStyle(color: DriverRatingColors.monoWhite);

  TextStyle get _goldTextStyle => const TextStyle(color: DriverRatingColors.gold);

  int get _counterFiveStars => driver.ratings.where((rating) => rating.rating == 5).length;

  int get _counterFourStars => driver.ratings.where((rating) => rating.rating == 4).length;

  int get _counterThreeStars => driver.ratings.where((rating) => rating.rating == 3).length;

  int get _counterTwoStars => driver.ratings.where((rating) => rating.rating == 2).length;

  int get _counterOneStars => driver.ratings.where((rating) => rating.rating == 1).length;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(DriverRatingDimens.micro),
        padding: const EdgeInsets.all(DriverRatingDimens.micro),
        decoration: BoxDecoration(
            color: DriverRatingColors.graySevenHundred, borderRadius: BorderRadius.circular(DriverRatingDimens.xxxs)),
        child: Column(children: [
          Padding(
              padding: const EdgeInsets.only(bottom: DriverRatingDimens.xxs),
              child: Text(TranslateHome.strings.ratingSummary).bodyMediumMedium(style: _goldTextStyle)),
          ClipOval(
              child: Image.asset(driver.photo,
                  package: _package,
                  fit: BoxFit.cover,
                  width: DriverRatingDimens.xxl,
                  height: DriverRatingDimens.xxl,
                  filterQuality: FilterQuality.high)),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: DriverRatingDimens.xxs),
              child: Text(driver.name).bodyBaseMedium(style: _monoWhiteTextStyle)),
          RatingSummary(
              counter: driver.ratings.length,
              average: driver.ratingValue,
              showAverage: true,
              label: TranslateHome.strings.ratings,
              counterFiveStars: _counterFiveStars,
              counterFourStars: _counterFourStars,
              counterThreeStars: _counterThreeStars,
              counterTwoStars: _counterTwoStars,
              counterOneStars: _counterOneStars)
        ]));
  }
}

import 'package:flutter/material.dart';
import 'package:module_commons/commons.dart';
import 'package:module_core/entities/driver.dart';
import 'package:module_external_dependencies/flutter_rating_bar.dart';
import 'package:module_home/i18n/translate.dart';

class DriverRatingDriverCardWidget extends StatelessWidget {
  final Driver driver;
  final Function(Driver) onTapDriver;

  const DriverRatingDriverCardWidget({super.key, required this.driver, required this.onTapDriver});

  String get _package => "module_assets";

  TextStyle get _textStyle => const TextStyle(color: DriverRatingColors.monoWhite);

  @override
  Widget build(BuildContext context) {
    return DriverRatingGestureDetectorWidget(
        onTap: () => onTapDriver(driver),
        child: Container(
            padding: const EdgeInsets.all(DriverRatingDimens.nano),
            decoration: const BoxDecoration(
                color: DriverRatingColors.graySevenHundred,
                borderRadius: BorderRadius.all(Radius.circular(DriverRatingDimens.micro))),
            child: Row(children: [
              Padding(
                  padding: const EdgeInsets.only(right: DriverRatingDimens.xxxs),
                  child: ClipOval(
                      child: Image.asset(driver.photo,
                          package: _package,
                          fit: BoxFit.cover,
                          width: DriverRatingDimens.sm,
                          height: DriverRatingDimens.sm,
                          filterQuality: FilterQuality.high))),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(driver.name).bodyBaseMedium(style: _textStyle),
                RatingBarIndicator(
                    itemPadding: const EdgeInsets.only(top: DriverRatingDimens.pico),
                    unratedColor: DriverRatingColors.monoWhite.withOpacity(DriverRatingOpacity.oneSixth),
                    itemBuilder: (context, index) => const Icon(Icons.star, color: DriverRatingColors.gold),
                    itemCount: 5,
                    rating: driver.ratingValue,
                    itemSize: DriverRatingDimens.macro)
              ]),
              const Spacer(),
              Column(children: [
                Text(TranslateHome.strings.reviews).bodyBaseMedium(style: _textStyle),
                Container(
                    margin: const EdgeInsets.only(top: DriverRatingDimens.femto),
                    padding: const EdgeInsets.all(DriverRatingDimens.femto),
                    decoration: const BoxDecoration(color: DriverRatingColors.gold, shape: BoxShape.circle),
                    child: Text(driver.ratings.length.toString()).bodySmallMedium())
              ]),
            ])));
  }
}

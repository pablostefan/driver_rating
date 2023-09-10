import 'package:flutter/material.dart';
import 'package:module_commons/commons.dart';
import 'package:module_external_dependencies/animated_rating_bar.dart';
import 'package:module_home/i18n/translate.dart';
import 'package:module_home/widgets/driver_rating_button_widget.dart';
import 'package:module_home/widgets/driver_rating_text_field_widget.dart';

class DiverRatingRateDriverWidget extends StatelessWidget {
  final ValueChanged<double> onRatingUpdate;
  final VoidCallback rateDriver;

  final TextEditingController controller;
  final FocusNode focusNode;
  final double rating;

  const DiverRatingRateDriverWidget({
    super.key,
    required this.onRatingUpdate,
    required this.controller,
    required this.focusNode,
    required this.rating,
    required this.rateDriver,
  });

  TextStyle get _goldTextStyle => const TextStyle(color: DriverRatingColors.gold);

  TextStyle get _monoWhiteTextStyle => const TextStyle(color: DriverRatingColors.monoWhite);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(DriverRatingDimens.micro),
        padding: const EdgeInsets.all(DriverRatingDimens.micro),
        decoration: BoxDecoration(
            color: DriverRatingColors.graySevenHundred, borderRadius: BorderRadius.circular(DriverRatingDimens.xxxs)),
        child: Column(children: [
          Text(TranslateHome.strings.rateDriver).bodyMediumMedium(style: _goldTextStyle),
          Padding(
              padding: const EdgeInsets.only(top: DriverRatingDimens.xxxs, bottom: DriverRatingDimens.femto),
              child: AnimatedRatingBar(
                  activeFillColor: DriverRatingColors.gold,
                  strokeColor: DriverRatingColors.monoWhite,
                  animationColor: DriverRatingColors.gold,
                  initialRating: 0,
                  onRatingUpdate: onRatingUpdate)),
          Text(TranslateHome.strings.score).bodySmallRegular(style: _monoWhiteTextStyle),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: DriverRatingDimens.xxs),
              child: DriverRatingTextFieldWidget(controller: controller, focusNode: focusNode)),
          DriverRatingButtonWidget(
              onPressed: rateDriver, text: TranslateHome.strings.rate.toUpperCase(), disabled: rating <= 0)
        ]));
  }
}

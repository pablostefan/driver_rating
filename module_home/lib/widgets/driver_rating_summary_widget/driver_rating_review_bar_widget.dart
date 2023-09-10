import 'package:flutter/material.dart';
import 'package:module_commons/commons.dart';

class ReviewBar extends StatelessWidget {
  final String label;
  final double value;

  const ReviewBar({Key? key, required this.label, required this.value}) : super(key: key);

  TextStyle get _textStyle => const TextStyle(color: DriverRatingColors.monoWhite);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: DriverRatingDimens.atto),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisSize: MainAxisSize.min, children: [
          Text(label).bodyBaseMedium(style: _textStyle),
          const SizedBox(width: DriverRatingDimens.xxss),
          Expanded(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(DriverRatingDimens.nano),
                  child: SizedBox(
                      height: DriverRatingDimens.xxxnano,
                      child: LinearProgressIndicator(
                          value: value,
                          valueColor: const AlwaysStoppedAnimation<Color>(DriverRatingColors.gold),
                          backgroundColor: DriverRatingColors.monoWhite))))
        ]));
  }
}

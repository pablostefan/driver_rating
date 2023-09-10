import 'package:flutter/material.dart';
import 'package:module_commons/commons.dart';
import 'package:module_core/entities/rating.dart';
import 'package:module_external_dependencies/flutter_rating_bar.dart';

class DiverRatingCardWidget extends StatelessWidget {
  final Rating rating;

  const DiverRatingCardWidget({super.key, required this.rating});

  TextStyle get _textStyle => const TextStyle(color: DriverRatingColors.monoWhite);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: DriverRatingDimens.xxxs),
        padding: const EdgeInsets.all(DriverRatingDimens.nano),
        decoration: BoxDecoration(
            color: DriverRatingColors.grayFiveHundred, borderRadius: BorderRadius.circular(DriverRatingDimens.xxxs)),
        child: Column(children: [
          RatingBarIndicator(
              unratedColor: DriverRatingColors.monoWhite.withOpacity(DriverRatingOpacity.oneSixth),
              itemBuilder: (context, index) => const Icon(Icons.star, color: DriverRatingColors.gold),
              itemCount: 5,
              rating: rating.rating.toDouble(),
              itemSize: DriverRatingDimens.xhmacro),
          Visibility(
              visible: rating.comment.isNotEmpty,
              child: Padding(
                  padding: const EdgeInsets.only(top: DriverRatingDimens.pico),
                  child: Text(rating.comment).bodyBaseRegular(style: _textStyle))),
        ]));
  }
}

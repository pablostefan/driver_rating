import 'package:flutter/material.dart';
import 'package:module_commons/commons.dart';

class DriverRatingButtonWidget extends StatelessWidget {
  final bool disabled;
  final EdgeInsets margin;
  final String text;
  final VoidCallback? onPressed;
  final double width;

  const DriverRatingButtonWidget({
    super.key,
    this.disabled = false,
    required this.text,
    this.margin = EdgeInsets.zero,
    this.onPressed,
    this.width = double.infinity,
  });

  Color get _backgroundColor => disabled ? DriverRatingColors.graySevenHundred : DriverRatingColors.grayTwoHundred;

  TextStyle get _textStyle => const TextStyle(color: DriverRatingColors.monoBlack);

  @override
  Widget build(BuildContext context) {
    return DriverRatingGestureDetectorWidget(
        onTap: disabled ? null : onPressed,
        child: Container(
            width: width,
            height: DriverRatingDimens.smxss,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: _backgroundColor,
                border: Border.all(color: DriverRatingColors.grayFiveHundred),
                borderRadius: BorderRadius.circular(DriverRatingDimens.xlhmacro)),
            margin: margin,
            child: Text(text).bodySmallSemiBold(style: _textStyle)));
  }
}

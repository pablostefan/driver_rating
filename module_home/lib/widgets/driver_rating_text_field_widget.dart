import 'package:flutter/material.dart';
import 'package:module_commons/commons.dart';
import 'package:module_home/i18n/translate.dart';

class DriverRatingTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;

  const DriverRatingTextFieldWidget({super.key, required this.controller, required this.focusNode});

  TextStyle get _textStyle => const TextStyle(color: DriverRatingColors.monoWhite);

  @override
  Widget build(BuildContext context) {
    return TextField(
        focusNode: focusNode,
        cursorColor: DriverRatingColors.monoWhite,
        controller: controller,
        maxLength: 100,
        keyboardType: TextInputType.text,
        onTapOutside: (_) => focusNode.unfocus(),
        style: const Text("").bodyMediumRegular(style: _textStyle).style,
        decoration: InputDecoration(
            labelText: TranslateHome.strings.review,
            labelStyle: const Text("").bodyMediumRegular(style: _textStyle).style,
            hintStyle: const Text("").bodyMediumRegular(style: _textStyle).style,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: DriverRatingColors.monoWhite.withOpacity(DriverRatingOpacity.twoThird))),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: DriverRatingColors.monoWhite, width: DriverRatingDimens.atto))));
  }
}

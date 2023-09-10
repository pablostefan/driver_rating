import 'package:flutter/material.dart';
import 'package:module_commons/commons.dart';
import 'package:module_home/i18n/translate.dart';

class DriverRatingSearchHeaderWidget extends StatelessWidget {
  final TextEditingController searchController;
  final GestureTapCallback onTapSuffixIcon;
  final ValueChanged<String> onChanged;
  final FocusNode searchFocus;

  const DriverRatingSearchHeaderWidget({
    super.key,
    required this.searchController,
    required this.onTapSuffixIcon,
    required this.onChanged,
    required this.searchFocus,
  });

  TextStyle get _textStyle => const TextStyle(color: DriverRatingColors.monoWhite);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
        delegate: _DriverRatingSearchHeaderDelegate(
            child: TextField(
                onChanged: onChanged,
                focusNode: searchFocus,
                cursorColor: DriverRatingColors.monoWhite,
                controller: searchController,
                keyboardType: TextInputType.text,
                onTapOutside: (_) => searchFocus.unfocus(),
                style: const Text("").bodyMediumRegular(style: _textStyle).style,
                decoration: InputDecoration(
                  labelText: TranslateHome.strings.search,
                  labelStyle: const Text("").bodyMediumRegular(style: _textStyle).style,
                  hintStyle: const Text("").bodyMediumRegular(style: _textStyle).style,
                  suffixIcon: DriverRatingGestureDetectorWidget(
                      onTap: onTapSuffixIcon, child: const Icon(Icons.search, color: DriverRatingColors.monoWhite)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: DriverRatingColors.monoWhite.withOpacity(DriverRatingOpacity.twoThird))),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: DriverRatingColors.monoWhite, width: DriverRatingDimens.atto)),
                ))));
  }
}

class _DriverRatingSearchHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _DriverRatingSearchHeaderDelegate({required this.child});

  @override
  double get minExtent => DriverRatingDimens.xll;

  @override
  double get maxExtent => DriverRatingDimens.xll;

  @override
  Widget build(context, shrinkOffset, overlapsContent) => child;

  @override
  bool shouldRebuild(oldDelegate) => true;
}

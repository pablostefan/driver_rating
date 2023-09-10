import 'package:flutter/material.dart';
import 'package:module_commons/commons.dart';
import 'package:module_external_dependencies/google_nav_bar.dart';
import 'package:module_home/i18n/translate.dart';

class DriverRatingBottomNavigationBarWidget extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabChange;

  const DriverRatingBottomNavigationBarWidget({super.key, required this.selectedIndex, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(DriverRatingDimens.xxs),
        decoration: BoxDecoration(
            color: DriverRatingColors.monoBlack.withOpacity(DriverRatingOpacity.oneNine),
            borderRadius: BorderRadius.circular(DriverRatingDimens.xxl)),
        child: GNav(
            selectedIndex: selectedIndex,
            onTabChange: onTabChange,
            tabMargin: const EdgeInsets.all(DriverRatingDimens.pico),
            backgroundColor: DriverRatingColors.transparent,
            color: DriverRatingColors.monoWhite,
            activeColor: DriverRatingColors.gold,
            tabBackgroundColor: DriverRatingColors.grayFiveHundred,
            gap: DriverRatingDimens.nano,
            padding: const EdgeInsets.all(DriverRatingDimens.xxxnano),
            tabs: [
              GButton(icon: Icons.home, text: TranslateHome.strings.home),
              GButton(icon: Icons.search, text: TranslateHome.strings.search),
              GButton(icon: Icons.history, text: TranslateHome.strings.history),
            ]));
  }
}

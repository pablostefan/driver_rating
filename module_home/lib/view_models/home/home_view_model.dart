import 'package:flutter/material.dart';
import 'package:module_core/entities/driver.dart';

class HomeViewModel {
  PageController pageController = PageController();
  int selectedIndex = 0;
  List<Driver> drivers = [];

  HomeViewModel copyWith({int? selectedIndex, List<Driver>? drivers}) {
    return HomeViewModel()
      ..drivers = drivers ?? this.drivers
      ..pageController = pageController
      ..selectedIndex = selectedIndex ?? this.selectedIndex;
  }
}

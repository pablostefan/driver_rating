import 'package:flutter/cupertino.dart';
import 'package:module_core/entities/driver.dart';

class SearchViewModel {
  List<Driver> drivers = <Driver>[];
  TextEditingController searchController = TextEditingController();
  FocusNode searchFocus = FocusNode();

  SearchViewModel copyWith({List<Driver>? drivers}) {
    return SearchViewModel()
      ..drivers = drivers ?? this.drivers
      ..searchFocus = searchFocus
      ..searchController = searchController;
  }
}

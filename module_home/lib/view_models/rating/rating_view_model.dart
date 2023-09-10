import 'package:flutter/material.dart';
import 'package:module_core/entities/driver.dart';

class RatingViewModel {
  double rating = 0;
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  Driver? driver;

  RatingViewModel copyWith({double? rating, Driver? driver}) {
    return RatingViewModel()
      ..driver = driver ?? this.driver
      ..rating = rating ?? this.rating
      ..focusNode = focusNode
      ..controller = controller;
  }
}

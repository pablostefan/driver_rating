import 'package:flutter/material.dart';
import 'package:module_commons/commons.dart';
import 'package:module_external_dependencies/flutter_modular.dart';
import 'package:module_external_dependencies/flutter_triple.dart';
import 'package:module_external_dependencies/lottie.dart';
import 'package:module_welcome/view_models/splash_screen/splash_screen_view_model.dart';

class SplashScreenStore extends Store<SplashScreenViewModel> {
  SplashScreenStore() : super(SplashScreenViewModel());

  void _openHomePage() => Modular.to.navigate(DriverRatingRoutes.home);

  void onLoaded(LottieComposition composition, AnimationController controller) {
    controller
      ..duration = composition.duration
      ..forward().whenComplete(_openHomePage);
  }
}

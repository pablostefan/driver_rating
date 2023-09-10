import 'package:flutter/material.dart';
import 'package:module_assets/assets.dart';
import 'package:module_commons/commons.dart';
import 'package:module_external_dependencies/flutter_modular.dart';
import 'package:module_external_dependencies/lottie.dart';
import 'package:module_welcome/stores/splash_screen/splash_screen_store.dart';
import 'package:module_welcome/view_models/splash_screen/splash_screen_view_model.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  final SplashScreenStore _store = Modular.get<SplashScreenStore>();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    _store.destroy();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DriverRatingScaffoldWidget<SplashScreenStore, SplashScreenViewModel>(
        store: _store,
        body: Center(
            child: Lottie.asset(DriverRatingLottie.rating.json,
                package: DriverRatingLottie.rating.package,
                onLoaded: (composition) => _store.onLoaded(composition, _controller))));
  }
}

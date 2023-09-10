import 'package:module_commons/commons.dart';
import 'package:module_external_dependencies/flutter_modular.dart';
import 'package:module_welcome/pages/splash_screen/splash_screen_page.dart';
import 'package:module_welcome/stores/splash_screen/splash_screen_store.dart';

class WelcomeModule extends Module {
  @override
  void binds(i) {
    i.addSingleton<SplashScreenStore>(SplashScreenStore.new);
  }

  @override
  void routes(r) {
    r.child(DriverRatingRoutes.splash, child: (context) => const SplashScreenPage());
  }
}

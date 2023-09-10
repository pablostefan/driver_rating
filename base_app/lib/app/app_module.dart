import 'package:module_external_dependencies/flutter_modular.dart';
import 'package:module_home/modules/home_module.dart';
import 'package:module_welcome/modules/welcome_module.dart';

class AppModule extends Module {
  @override
  void routes(r) {
    r.module(Modular.initialRoute, module: HomeModule());
    r.module(Modular.initialRoute, module: WelcomeModule());
  }
}

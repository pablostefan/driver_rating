import 'package:module_core/database/objectbox_database.dart';
import 'package:module_core/repositories/drivers/drivers_repository.dart';
import 'package:module_core/repositories/drivers/interface/drivers_repository_interface.dart';
import 'package:module_external_dependencies/flutter_modular.dart';
import 'package:module_home/modules/home_module.dart';
import 'package:module_welcome/modules/welcome_module.dart';

class AppModule extends Module {
  @override
  void exportedBinds(i) {
    i.addSingleton<ObjectBox>(ObjectBox.new);
    i.add<IDriversRepository>(DriversRepository.new);
  }

  @override
  void routes(r) {
    r.module(Modular.initialRoute, module: HomeModule());
    r.module(Modular.initialRoute, module: WelcomeModule());
  }
}

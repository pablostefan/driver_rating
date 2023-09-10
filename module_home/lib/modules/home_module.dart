import 'package:base_app/app/app_module.dart';
import 'package:module_commons/commons.dart';
import 'package:module_external_dependencies/flutter_modular.dart';
import 'package:module_home/pages/home/home_page.dart';
import 'package:module_home/pages/rating/rating_page.dart';
import 'package:module_home/stores/drivers/drivers_store.dart';
import 'package:module_home/stores/historic/historic_store.dart';
import 'package:module_home/stores/home/home_store.dart';
import 'package:module_home/stores/rating/rating_store.dart';
import 'package:module_home/stores/search/search_store.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [AppModule()];

  @override
  void binds(i) {
    i.addSingleton<HomeStore>(HomeStore.new);
    i.addSingleton<HistoricStore>(HistoricStore.new);
    i.addSingleton<RatingStore>(RatingStore.new);
    i.addSingleton<DriversStore>(DriversStore.new);
    i.addSingleton<SearchStore>(SearchStore.new);
  }

  @override
  void routes(r) {
    r.child(DriverRatingRoutes.home, child: (context) => const HomePage());
    r.child(DriverRatingRoutes.rating, child: (context) => RatingPage(driver: r.args.data));
  }
}

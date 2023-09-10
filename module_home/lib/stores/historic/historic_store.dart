import 'package:module_commons/commons.dart';
import 'package:module_core/entities/driver.dart';
import 'package:module_external_dependencies/flutter_modular.dart';
import 'package:module_external_dependencies/flutter_triple.dart';
import 'package:module_home/view_models/historic/historic_view_model.dart';

class HistoricStore extends Store<HistoricViewModel> {
  HistoricStore() : super(HistoricViewModel());

  void onTapDriver(Driver driver) => Modular.to.pushNamed(DriverRatingRoutes.rating, arguments: driver);
}

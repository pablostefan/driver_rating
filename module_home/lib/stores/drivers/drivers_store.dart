import 'package:module_commons/commons.dart';
import 'package:module_core/entities/driver.dart';
import 'package:module_external_dependencies/flutter_modular.dart';
import 'package:module_external_dependencies/flutter_triple.dart';
import 'package:module_home/view_models/drivers/drivers_view_model.dart';

class DriversStore extends Store<DriversViewModel> {
  DriversStore() : super(DriversViewModel());

  void onTapDriver(Driver driver) => Modular.to.pushNamed(DriverRatingRoutes.rating, arguments: driver);
}

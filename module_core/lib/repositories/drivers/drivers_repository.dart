import 'package:module_commons/error/driver_rating_error.dart';
import 'package:module_core/database/objectbox.g.dart';
import 'package:module_core/database/objectbox_database.dart';
import 'package:module_core/entities/driver.dart';
import 'package:module_core/helpers/execute_with_catch.dart';
import 'package:module_core/models/default_drivers_model.dart';
import 'package:module_core/repositories/drivers/interface/drivers_repository_interface.dart';
import 'package:module_external_dependencies/either_dart.dart';

class DriversRepository extends IDriversRepository {
  final ObjectBox objectBox;

  DriversRepository(this.objectBox);

  @override
  Future<Either<DriverRatingError, List<Driver>>> getAllDrivers() {
    return executeWithCatch(() async {
      Box<Driver> driverBox = await objectBox.driverBox;
      List<Driver> drivers = await driverBox.getAllAsync();
      if (drivers.isEmpty) await putDefaultDrivers();
      return drivers.isEmpty ? DefaultDriversModel.defaultDrivers : drivers;
    });
  }

  @override
  Future<Either<DriverRatingError, void>> putDrivers(List<Driver> drivers) {
    return executeWithCatch(() async {
      Box<Driver> driverBox = await objectBox.driverBox;
      await driverBox.putManyAsync(drivers);
    });
  }

  @override
  Future<Either<DriverRatingError, void>> putDriver(Driver driver) {
    return executeWithCatch(() async {
      Box<Driver> driverBox = await objectBox.driverBox;
      await driverBox.putAsync(driver);
    });
  }

  @override
  Future<Either<DriverRatingError, void>> update(Driver driver) {
    return executeWithCatch(() async {
      Box<Driver> driverBox = await objectBox.driverBox;
      await driverBox.putAsync(driver);
    });
  }

  @override
  Future<Either<DriverRatingError, void>> removeAllDrivers() {
    return executeWithCatch(() async {
      Box<Driver> driverBox = await objectBox.driverBox;
      await driverBox.removeAllAsync();
    });
  }

  Future<Either<DriverRatingError, void>> putDefaultDrivers() {
    return executeWithCatch(() async {
      DefaultDriversModel.defaultDriversWithRatings.forEach((driver) async => await putDriver(driver));
    });
  }
}

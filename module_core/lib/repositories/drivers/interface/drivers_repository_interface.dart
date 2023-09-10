import 'package:module_commons/commons.dart';
import 'package:module_core/entities/driver.dart';
import 'package:module_external_dependencies/either_dart.dart';

abstract class IDriversRepository {
  Future<Either<DriverRatingError, List<Driver>>> getAllDrivers();

  Future<Either<DriverRatingError, void>> putDrivers(List<Driver> drivers);

  Future<Either<DriverRatingError, void>> putDriver(Driver driver);

  Future<Either<DriverRatingError, void>> update(Driver driver);

  Future<Either<DriverRatingError, void>> removeAllDrivers();
}

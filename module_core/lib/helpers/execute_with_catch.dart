import 'package:module_commons/commons.dart';
import 'package:module_external_dependencies/either_dart.dart';

Future<Either<DriverRatingError, T>> executeWithCatch<T>(Future Function() function) async {
  try {
    return Right(await function.call());
  } catch (error) {
    return Left(DriverRatingError(message: TranslateCommons.strings.requestError));
  }
}

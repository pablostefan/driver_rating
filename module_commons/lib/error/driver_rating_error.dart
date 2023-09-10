import 'package:module_external_dependencies/animated_snack_bar.dart';

class DriverRatingError {
  final String message;

  final AnimatedSnackBarType type;

  DriverRatingError({required this.message, this.type = AnimatedSnackBarType.error});
}

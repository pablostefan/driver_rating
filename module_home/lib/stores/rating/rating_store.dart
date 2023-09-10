import 'package:module_commons/commons.dart';
import 'package:module_core/entities/driver.dart';
import 'package:module_core/entities/rating.dart';
import 'package:module_core/repositories/drivers/interface/drivers_repository_interface.dart';
import 'package:module_external_dependencies/animated_snack_bar.dart';
import 'package:module_external_dependencies/flutter_modular.dart';
import 'package:module_external_dependencies/flutter_triple.dart';
import 'package:module_home/i18n/translate.dart';
import 'package:module_home/stores/home/home_store.dart';
import 'package:module_home/view_models/rating/rating_view_model.dart';

class RatingStore extends Store<RatingViewModel> {
  final IDriversRepository driversRepository;

  RatingStore({required this.driversRepository}) : super(RatingViewModel());

  void onRatingUpdate(double rating) => update(state.copyWith(rating: rating));

  void updateDriver(Driver driver) => update(state.copyWith(driver: driver));

  void rateDriver(Driver driver) async {
    setLoading(true);
    _setRatingDriver(driver);
    await _rateDriverUpdate(driver);
    setLoading(false);
  }

  void _setRatingDriver(Driver driver) {
    Rating rating =
        Rating(rating: state.rating.toInt(), comment: state.controller.text, date: DateTime.now(), userRating: true);
    driver.ratings.add(rating);
    driver.rated = true;
  }

  Future<void> _rateDriverUpdate(Driver driver) async {
    var response = await driversRepository.update(driver);
    response.fold(setError, (_) => _rateDriverUpdateSuccess(driver));
  }

  void _rateDriverUpdateSuccess(Driver driver) {
    updateDriver(driver);
    Modular.get<HomeStore>().getDrivers();
    setError(DriverRatingError(message: TranslateHome.strings.successRateDriver, type: AnimatedSnackBarType.success));
  }
}

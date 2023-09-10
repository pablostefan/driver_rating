enum DriverRatingLottie { rating }

extension DriverRatingLottieExtension on DriverRatingLottie {
  String get json => "animations/$name.json";

  String get package => "module_assets";
}

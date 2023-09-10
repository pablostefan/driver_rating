enum DriverRatingVector { ic_check, ic_alert, ic_dash }

extension DriverRatingVectorExtension on DriverRatingVector {
  String get svg => "vectors/$name.svg";

  String get package => "module_assets";
}

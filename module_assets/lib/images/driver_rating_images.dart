enum DiverRatingImages {
  driver_one,
  driver_two,
  driver_three,
  driver_four,
  driver_five,
  driver_six,
  driver_seven,
  driver_eight,
  driver_nine,
}

extension DiverRatingImagesExtension on DiverRatingImages {
  String get jpg => "images/$name.jpg";

  String get package => "module_assets";
}

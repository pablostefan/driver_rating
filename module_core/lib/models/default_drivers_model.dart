import 'package:module_assets/assets.dart';
import 'package:module_core/entities/driver.dart';
import 'package:module_core/entities/rating.dart';

abstract class DefaultDriversModel {
  static List<Driver> defaultDrivers = [
    Driver(name: 'Lewis Hamilton', photo: DiverRatingImages.driver_one.jpg),
    Driver(name: 'Max Verstappen', photo: DiverRatingImages.driver_two.jpg),
    Driver(name: 'Sebastian Vettel', photo: DiverRatingImages.driver_three.jpg),
    Driver(name: 'Charles Leclerc', photo: DiverRatingImages.driver_four.jpg),
    Driver(name: 'Fernando Alonso', photo: DiverRatingImages.driver_five.jpg),
    Driver(name: 'Daniel Ricciardo', photo: DiverRatingImages.driver_six.jpg),
    Driver(name: 'Lando Norris', photo: DiverRatingImages.driver_seven.jpg),
    Driver(name: 'Valtteri Bottas', photo: DiverRatingImages.driver_eight.jpg),
    Driver(name: 'Sergio Perez', photo: DiverRatingImages.driver_nine.jpg),
  ];

  static List<Rating> defaultRatings = [
    Rating(rating: 5, comment: 'Very good driver', date: DateTime.now()),
    Rating(rating: 5, comment: 'Very good driver', date: DateTime.now()),
    Rating(rating: 5, comment: 'Very good driver', date: DateTime.now()),
    Rating(rating: 4, comment: 'Very good driver', date: DateTime.now()),
    Rating(rating: 4, comment: 'Very good driver', date: DateTime.now()),
    Rating(rating: 3, comment: 'Very good driver', date: DateTime.now()),
    Rating(rating: 2, comment: 'Very good driver', date: DateTime.now()),
    Rating(rating: 1, comment: 'Very good driver', date: DateTime.now()),
  ];

  static List<Driver> get defaultDriversWithRatings => defaultDrivers.map((driver) {
        driver.ratings.addAll(defaultRatings);
        return driver;
      }).toList();
}

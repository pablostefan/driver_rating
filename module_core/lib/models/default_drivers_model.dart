import 'package:module_assets/assets.dart';
import 'package:module_core/entities/driver.dart';
import 'package:module_core/entities/rating.dart';

abstract class DefaultDriversModel {
  static List<Driver> defaultDrivers = [
    Driver(id: 1, name: 'Lewis Hamilton', photo: DiverRatingImages.driver_one.jpg),
    Driver(id: 2, name: 'Max Verstappen', photo: DiverRatingImages.driver_two.jpg),
    Driver(id: 3, name: 'Sebastian Vettel', photo: DiverRatingImages.driver_three.jpg),
    Driver(id: 4, name: 'Charles Leclerc', photo: DiverRatingImages.driver_four.jpg),
    Driver(id: 5, name: 'Fernando Alonso', photo: DiverRatingImages.driver_five.jpg),
    Driver(id: 6, name: 'Daniel Ricciardo', photo: DiverRatingImages.driver_six.jpg),
    Driver(id: 7, name: 'Lando Norris', photo: DiverRatingImages.driver_seven.jpg),
    Driver(id: 8, name: 'Valtteri Bottas', photo: DiverRatingImages.driver_eight.jpg),
    Driver(id: 9, name: 'Sergio Perez', photo: DiverRatingImages.driver_nine.jpg),
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

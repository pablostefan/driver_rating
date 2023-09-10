import 'package:module_core/entities/driver.dart';
import 'package:module_external_dependencies/objectbox.dart';

@Entity()
class Rating {
  int id = 0;
  final int rating;
  final String comment;
  final bool userRating;

  @Property(type: PropertyType.date)
  DateTime date;

  final ToOne<Driver> driver = ToOne<Driver>();

  Rating({this.id = 0, required this.rating, required this.comment, required this.date, this.userRating = false});
}

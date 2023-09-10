import 'package:module_core/entities/rating.dart';
import 'package:module_external_dependencies/objectbox.dart';

@Entity()
class Driver {
  int id = 0;
  final String name;
  final String photo;
  bool rated;

  @Backlink('driver')
  final ToMany<Rating> ratings = ToMany<Rating>();

  double get ratingValue {
    try {
      return ratings.map((rating) => rating.rating).reduce((value, element) => value + element) / ratings.length;
    } catch (e) {
      return 0;
    }
  }

  Driver({this.id = 0, required this.name, required this.photo, this.rated = false});
}

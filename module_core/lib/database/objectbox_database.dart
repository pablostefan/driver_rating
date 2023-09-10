import 'package:module_core/database/objectbox.g.dart';
import 'package:module_core/entities/driver.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class ObjectBox {
  Store? _store;

  Future<Store> get store async => _store ??= await _newStore;

  Future<Store> get _newStore async {
    final directory = await getApplicationDocumentsDirectory();
    return openStore(directory: path.join(directory.path, "driver-rating"));
  }

  Future<Box<Driver>> get driverBox async => Box<Driver>(await store);
}

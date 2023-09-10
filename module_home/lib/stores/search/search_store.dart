import 'package:module_core/entities/driver.dart';
import 'package:module_core/repositories/drivers/interface/drivers_repository_interface.dart';
import 'package:module_external_dependencies/flutter_modular.dart';
import 'package:module_external_dependencies/flutter_triple.dart';
import 'package:module_home/stores/home/home_store.dart';
import 'package:module_home/view_models/search/search_view_model.dart';

class SearchStore extends Store<SearchViewModel> {
  final IDriversRepository driversRepository;

  SearchStore({required this.driversRepository}) : super(SearchViewModel());

  void onTapDriver(Driver driver) {}

  void onChanged(String value) => value.isEmpty ? _setDefaultValue() : _setSearchDrivers(value);

  void onTapSuffixIcon() => onChanged(state.searchController.text);

  void _setDefaultValue() => update(state.copyWith(drivers: state.drivers));

  void _setSearchDrivers(String value) {
    List<Driver> drivers = Modular.get<HomeStore>().state.drivers;
    var search = drivers.where((driver) => driver.name.toLowerCase().contains(value.toLowerCase())).toList();
    update(state.copyWith(drivers: search));
  }

  void setDrivers(List<Driver> drivers) => update(state.copyWith(drivers: drivers));
}

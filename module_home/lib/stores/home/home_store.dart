import 'package:flutter/material.dart';
import 'package:module_commons/commons.dart';
import 'package:module_core/repositories/drivers/interface/drivers_repository_interface.dart';
import 'package:module_external_dependencies/flutter_triple.dart';
import 'package:module_home/view_models/home/home_view_model.dart';

class HomeStore extends Store<HomeViewModel> {
  final IDriversRepository driversRepository;

  HomeStore({required this.driversRepository}) : super(HomeViewModel());

  @override
  void initStore() {
    super.initStore();
    _getHomeData();
  }

  void onTabChange(int index) {
    state.pageController.animateToPage(index, duration: DriverRatingDuration.changePage, curve: Curves.easeInOut);
  }

  void onPageChange(int index) => update(state.copyWith(selectedIndex: index));

  void _getHomeData() async {
    setLoading(true);
    await _putDefaultDrivers();
    await getDrivers();
    setLoading(false);
  }

  Future<void> _putDefaultDrivers() async => await driversRepository.putDefaultDrivers();

  Future<void> getDrivers() async {
    var result = await driversRepository.getAllDrivers();
    result.fold(setError, (drivers) => update(state.copyWith(drivers: drivers)));
  }
}

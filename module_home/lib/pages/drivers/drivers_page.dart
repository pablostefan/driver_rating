import 'package:flutter/material.dart';
import 'package:module_commons/commons.dart';
import 'package:module_core/entities/driver.dart';
import 'package:module_external_dependencies/flutter_modular.dart';
import 'package:module_home/stores/drivers/drivers_store.dart';
import 'package:module_home/stores/home/home_store.dart';
import 'package:module_home/view_models/drivers/drivers_view_model.dart';
import 'package:module_home/widgets/driver_rating_driver_card_widget.dart';

class DriversPage extends StatefulWidget {
  const DriversPage({super.key});

  @override
  State<DriversPage> createState() => _DriversPageState();
}

class _DriversPageState extends State<DriversPage> {
  final DriversStore _store = Modular.get<DriversStore>();

  List<Driver> get _drivers => Modular.get<HomeStore>().state.drivers;

  @override
  Widget build(BuildContext context) {
    return DriverRatingScaffoldWidget<DriversStore, DriversViewModel>(
        store: _store,
        backgroundColor: DriverRatingColors.grayNineHundred,
        body: ListView.separated(
            padding: const EdgeInsets.fromLTRB(
                DriverRatingDimens.xxxs, DriverRatingDimens.xxxs, DriverRatingDimens.xxxs, DriverRatingDimens.xxl),
            itemBuilder: (_, index) =>
                DriverRatingDriverCardWidget(driver: _drivers[index], onTapDriver: _store.onTapDriver),
            separatorBuilder: (_, __) => const SizedBox(height: DriverRatingDimens.xxxs),
            itemCount: _drivers.length));
  }
}

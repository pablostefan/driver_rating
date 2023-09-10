import 'package:flutter/material.dart';
import 'package:module_commons/commons.dart';
import 'package:module_core/entities/driver.dart';
import 'package:module_external_dependencies/flutter_modular.dart';
import 'package:module_home/stores/historic/historic_store.dart';
import 'package:module_home/stores/home/home_store.dart';
import 'package:module_home/view_models/historic/historic_view_model.dart';
import 'package:module_home/widgets/driver_rating_historic_card_widget.dart';

class HistoricPage extends StatefulWidget {
  const HistoricPage({super.key});

  @override
  State<HistoricPage> createState() => _HistoricPageState();
}

class _HistoricPageState extends State<HistoricPage> {
  final HistoricStore _store = Modular.get<HistoricStore>();

  List<Driver> get _historic => Modular.get<HomeStore>().state.drivers.where((element) => element.rated).toList();

  @override
  Widget build(BuildContext context) {
    return DriverRatingScaffoldWidget<HistoricStore, HistoricViewModel>(
        store: _store,
        backgroundColor: DriverRatingColors.grayNineHundred,
        body: CustomScrollView(slivers: [
          SliverPadding(
              padding: const EdgeInsets.all(DriverRatingDimens.xxxs),
              sliver: SliverList.separated(
                  itemBuilder: (_, index) =>
                      DriverRatingHistoricCardWidget(driver: _historic[index], onTapDriver: _store.onTapDriver),
                  separatorBuilder: (_, __) => const SizedBox(height: DriverRatingDimens.xxxs),
                  itemCount: _historic.length)),
        ]));
  }
}

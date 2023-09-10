import 'package:flutter/material.dart';
import 'package:module_commons/commons.dart';
import 'package:module_external_dependencies/flutter_modular.dart';
import 'package:module_external_dependencies/flutter_triple.dart';
import 'package:module_home/pages/drivers/drivers_page.dart';
import 'package:module_home/pages/historic/historic_page.dart';
import 'package:module_home/pages/search/search_page.dart';
import 'package:module_home/stores/home/home_store.dart';
import 'package:module_home/view_models/home/home_view_model.dart';
import 'package:module_home/widgets/driver_rating_bottom_navigation_bar_widget.dart';
import 'package:module_home/widgets/driver_rating_home_app_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeStore _store = Modular.get<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return DriverRatingScaffoldWidget<HomeStore, HomeViewModel>(
        store: _store,
        extendBody: true,
        appBar: DiverRatingHomeAppBarWidget(),
        body: PageView(onPageChanged: _store.onPageChange, controller: _store.state.pageController, children: const [
          DriversPage(),
          SearchPage(),
          HistoricPage(),
        ]),
        bottomNavigationBar: TripleBuilder<HomeStore, HomeViewModel>(
            store: _store,
            builder: (_, triple) => DriverRatingBottomNavigationBarWidget(
                selectedIndex: triple.state.selectedIndex, onTabChange: _store.onTabChange)));
  }
}

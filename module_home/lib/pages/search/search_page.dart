import 'package:flutter/material.dart';
import 'package:module_commons/commons.dart';
import 'package:module_external_dependencies/flutter_modular.dart';
import 'package:module_external_dependencies/flutter_triple.dart';
import 'package:module_home/stores/home/home_store.dart';
import 'package:module_home/stores/search/search_store.dart';
import 'package:module_home/view_models/search/search_view_model.dart';
import 'package:module_home/widgets/driver_rating_driver_card_widget.dart';
import 'package:module_home/widgets/driver_rating_search_header_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final SearchStore _store = Modular.get<SearchStore>();

  @override
  void initState() {
    super.initState();
    _store.setDrivers(Modular.get<HomeStore>().state.drivers);
  }

  @override
  Widget build(BuildContext context) {
    return DriverRatingScaffoldWidget<SearchStore, SearchViewModel>(
        store: _store,
        backgroundColor: DriverRatingColors.grayNineHundred,
        extendBody: true,
        body: TripleBuilder<SearchStore, SearchViewModel>(
            store: _store,
            builder: (context, triple) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: DriverRatingDimens.xxxs),
                child: CustomScrollView(slivers: [
                  DriverRatingSearchHeaderWidget(
                      searchController: triple.state.searchController,
                      searchFocus: triple.state.searchFocus,
                      onTapSuffixIcon: _store.onTapSuffixIcon,
                      onChanged: _store.onChanged),
                  SliverPadding(
                      padding: const EdgeInsets.only(top: DriverRatingDimens.xxxs, bottom: DriverRatingDimens.xxl),
                      sliver: SliverList.separated(
                          itemBuilder: (_, index) => DriverRatingDriverCardWidget(
                              driver: triple.state.drivers[index], onTapDriver: _store.onTapDriver),
                          separatorBuilder: (_, __) => const SizedBox(height: DriverRatingDimens.xxxs),
                          itemCount: triple.state.drivers.length)),
                ]))));
  }
}

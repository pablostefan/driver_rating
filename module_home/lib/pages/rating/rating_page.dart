import 'package:flutter/material.dart';
import 'package:module_commons/commons.dart';
import 'package:module_core/entities/driver.dart';
import 'package:module_external_dependencies/flutter_modular.dart';
import 'package:module_external_dependencies/flutter_triple.dart';
import 'package:module_home/i18n/translate.dart';
import 'package:module_home/stores/rating/rating_store.dart';
import 'package:module_home/view_models/rating/rating_view_model.dart';
import 'package:module_home/widgets/driver_rating_driver_summary_widget.dart';
import 'package:module_home/widgets/driver_rating_list_widget.dart';
import 'package:module_home/widgets/driver_rating_rate_driver_widget.dart';

class RatingPage extends StatefulWidget {
  final Driver driver;

  const RatingPage({super.key, required this.driver});

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  final RatingStore _store = Modular.get<RatingStore>();

  TextStyle get _textStyle => const TextStyle(color: DriverRatingColors.monoWhite);

  @override
  void initState() {
    super.initState();
    _store.updateDriver(widget.driver);
  }

  @override
  Widget build(BuildContext context) {
    return DriverRatingScaffoldWidget<RatingStore, RatingViewModel>(
        store: _store,
        backgroundColor: DriverRatingColors.grayNineHundred,
        appBar: AppBar(
            leading: IconButton(
                splashColor: DriverRatingColors.transparent,
                hoverColor: DriverRatingColors.transparent,
                highlightColor: DriverRatingColors.transparent,
                onPressed: Modular.to.pop,
                icon: const Icon(Icons.arrow_back_ios, color: DriverRatingColors.monoWhite)),
            backgroundColor: DriverRatingColors.monoBlack,
            title: Text(TranslateHome.strings.rateDriver).bodyLargeSemiBold(style: _textStyle)),
        body: TripleBuilder<RatingStore, RatingViewModel>(
            store: _store,
            builder: (_, triple) => ListView(children: [
                  DriverRatingSummaryWidget(driver: triple.state.driver ?? widget.driver),
                  DiverRatingRateDriverWidget(
                      rating: triple.state.rating,
                      onRatingUpdate: _store.onRatingUpdate,
                      controller: triple.state.controller,
                      focusNode: triple.state.focusNode,
                      rateDriver: () => _store.rateDriver(triple.state.driver ?? widget.driver)),
                  DriverRatingListWidget(driver: triple.state.driver ?? widget.driver)
                ])));
  }
}

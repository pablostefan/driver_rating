import 'package:flutter/material.dart';
import 'package:module_commons/commons.dart';
import 'package:module_external_dependencies/animated_snack_bar.dart';
import 'package:module_external_dependencies/flutter_triple.dart';

class DriverRatingScaffoldWidget<TStore extends BaseStore<TState>, TState extends Object> extends StatelessWidget {
  final TStore store;
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final bool extendBodyBehindAppBar;
  final bool extendBody;
  final Color backgroundColor;
  final double? progressIndicatorValue;
  final Widget? floatingActionButton;

  const DriverRatingScaffoldWidget({
    super.key,
    required this.body,
    required this.store,
    this.progressIndicatorValue,
    this.backgroundColor = DriverRatingColors.monoWhite,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.appBar,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.floatingActionButton,
  });

  void _onError(BuildContext context, DriverRatingError error) {
    AnimatedSnackBar.material(
      error.message,
      type: error.type,
      duration: DriverRatingDuration.alert,
      snackBarStrategy: RemoveSnackBarStrategy(),
    ).show(context);
  }

  void _listener(BuildContext context, Triple<TState> triple) {
    if (triple.event == TripleEvent.error) _onError(context, triple.error);
  }

  @override
  Widget build(BuildContext context) {
    return TripleConsumer<TStore, Exception, TState>(
        store: store,
        listener: _listener,
        builder: (_, triple) => DriverRatingLoadingPageWidget(
            isLoading: triple.isLoading,
            value: progressIndicatorValue,
            child: Scaffold(
                floatingActionButton: floatingActionButton,
                backgroundColor: backgroundColor,
                extendBody: extendBody,
                extendBodyBehindAppBar: extendBodyBehindAppBar,
                appBar: appBar,
                body: body,
                bottomNavigationBar: bottomNavigationBar,
                bottomSheet: bottomSheet)));
  }
}

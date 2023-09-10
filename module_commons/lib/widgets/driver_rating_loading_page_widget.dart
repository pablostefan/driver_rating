import 'package:flutter/material.dart';
import 'package:module_commons/commons.dart';
import 'package:module_external_dependencies/modal_progress_hud_nsn.dart';

class DriverRatingLoadingPageWidget extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  final double? value;

  const DriverRatingLoadingPageWidget({super.key, required this.child, required this.isLoading, this.value});

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
        dismissible: false,
        inAsyncCall: isLoading,
        color: DriverRatingColors.monoBlack,
        progressIndicator: Center(child: CircularProgressIndicator(color: DriverRatingColors.monoWhite, value: value)),
        child: child);
  }
}

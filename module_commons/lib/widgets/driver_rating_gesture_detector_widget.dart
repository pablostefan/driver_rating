import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DriverRatingGestureDetectorWidget extends StatelessWidget {
  final Function()? onTap;
  final Widget child;

  const DriverRatingGestureDetectorWidget({super.key, this.onTap, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTap?.call();
          HapticFeedback.lightImpact();
        },
        child: child);
  }
}

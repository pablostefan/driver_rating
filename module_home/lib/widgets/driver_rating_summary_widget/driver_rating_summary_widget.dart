/// Libary to display a summary of ratings.
///
/// This library is used to displayimport 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:module_commons/commons.dart';
import 'package:module_home/widgets/driver_rating_summary_widget/driver_rating_rating_bar_indicator_widget.dart';
import 'package:module_home/widgets/driver_rating_summary_widget/driver_rating_review_bar_widget.dart';

class RatingSummary extends StatefulWidget {
  final int counter;
  final double average;
  final bool showAverage;
  final int counterFiveStars;
  final int counterFourStars;
  final int counterThreeStars;
  final int counterTwoStars;
  final int counterOneStars;
  final String labelCounterFiveStars;
  final String labelCounterFourStars;
  final String labelCounterThreeStars;
  final String labelCounterTwoStars;
  final String labelCounterOneStars;
  final String label;

  const RatingSummary({
    Key? key,
    required this.counter,
    this.average = 0.0,
    this.showAverage = true,
    this.counterFiveStars = 0,
    this.counterFourStars = 0,
    this.counterThreeStars = 0,
    this.counterTwoStars = 0,
    this.counterOneStars = 0,
    this.labelCounterFiveStars = '5',
    this.labelCounterFourStars = '4',
    this.labelCounterThreeStars = '3',
    this.labelCounterTwoStars = '2',
    this.labelCounterOneStars = '1',
    this.label = 'Ratings',
  }) : super(key: key);

  @override
  State<RatingSummary> createState() => _RatingSummaryState();
}

class _RatingSummaryState extends State<RatingSummary> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  TextStyle get _textStyle => const TextStyle(color: DriverRatingColors.monoWhite);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: DriverRatingDuration.summaryAnimation);
    _animation = CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
    WidgetsBinding.instance.addPostFrameCallback((_) => _animationController.forward(from: 0));
  }

  @override
  void didChangeDependencies() {
    _animationController.forward(from: 0);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  double getReviewBarValue(int counterStars) {
    try {
      return (counterStars / widget.counter) * _animation.value;
    } catch (e) {
      return 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (_, __) =>
            Row(mainAxisSize: MainAxisSize.min, children: [
              Flexible(
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    ReviewBar(label: widget.labelCounterFiveStars, value: getReviewBarValue(widget.counterFiveStars)),
                    ReviewBar(label: widget.labelCounterFourStars, value: getReviewBarValue(widget.counterFourStars)),
                    ReviewBar(label: widget.labelCounterThreeStars, value: getReviewBarValue(widget.counterThreeStars)),
                    ReviewBar(label: widget.labelCounterTwoStars, value: getReviewBarValue(widget.counterTwoStars)),
                    ReviewBar(label: widget.labelCounterOneStars, value: getReviewBarValue(widget.counterOneStars))
                  ])),
              const SizedBox(width: DriverRatingDimens.xlhmacro),
              Flexible(
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Text(widget.average.toStringAsFixed(1)).titleExtraLargeThreeBold(style: _textStyle),
                    RatingBarIndicator(
                        rating: widget.average * _animation.value,
                        itemSize: DriverRatingDimens.xhmacro,
                        itemBuilder: (context, index) => const Icon(Icons.star, color: DriverRatingColors.gold)),
                    const SizedBox(height: DriverRatingDimens.xxxnano),
                    Text("${widget.counter} ${widget.label}", overflow: TextOverflow.fade)
                        .bodyBaseSemiBold(style: _textStyle)
                  ]))
            ]));
  }
}

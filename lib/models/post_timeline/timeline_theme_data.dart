import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class TimelineThemeData with Diagnosticable {
  TimelineThemeData({
    this.gutterSpacing = 5.0,
    this.itemGap = 10.0,
    this.lineGap = -6.0,
    this.indent = 2.0,
    this.endIndent = 2.0,
    this.strokeWidth = 2.0,
    this.strokeCap = StrokeCap.butt,
    this.lineColor = const Color(0xFFB0BEC5),
    this.style = PaintingStyle.stroke,
  })  : assert(itemGap >= 0),
        assert(lineGap <= 2);

  final Color lineColor;
  final double lineGap;
  final StrokeCap strokeCap;
  final double strokeWidth;
  final PaintingStyle style;
  final double itemGap;
  final double gutterSpacing;
  final double indent;
  final double endIndent;

  /// Whether all the properties of this object are non-null.
  bool get isConcrete => lineColor != null; // &&

  /// Creates an timeline them with some reasonable default values.
  ///
  /// The [color] is black, the [opacity] is 1.0, and the [size] is 24.0.
  const TimelineThemeData.fallback()
      : lineColor = const Color(0xFFB0BEC5),
        lineGap = 2.0,
        indent = 2.0,
        endIndent = 2.0,
        strokeCap = StrokeCap.butt,
        strokeWidth = 4.0,
        style = PaintingStyle.stroke,
        itemGap = 24.0,
        gutterSpacing = 12.0;
//      : color = const Color(0xFF000000),
//        _opacity = 1.0,
//        size = 24.0;

  TimelineThemeData copyWith(
      {Color lineColor, StrokeCap strokeCap, double strokeWidth}) {
    return TimelineThemeData(
      lineColor: lineColor ?? this.lineColor,
      strokeCap: strokeCap ?? this.strokeCap,
      strokeWidth: strokeWidth ?? this.strokeWidth,
    );
  }

  TimelineThemeData resolve(BuildContext context) => this;
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:skip/models/post_timeline/event_item.dart';
import 'package:skip/models/post_timeline/flutter_timeline.dart';
import 'package:skip/models/post_timeline/timeline_theme_data.dart';

class Timeline extends StatelessWidget {
  const Timeline({
    @required this.events,
    this.isLeftAligned = true,
    this.padding = const EdgeInsets.all(8),
    this.controller,
    this.physics,
    this.shrinkWrap = true,
    this.primary = false,
    this.reverse = false,
    this.indicatorSize = 8.0,
    // item gap will be ignored when custom separatorBuilder is provided
    this.separatorBuilder,
  }) : itemCount = events.length;

  final List<TimelineEventDisplay> events;
  final double indicatorSize;
  final bool isLeftAligned;
  final EdgeInsets padding;
  final ScrollController controller;
  final int itemCount;
  final ScrollPhysics physics;
  final bool shrinkWrap;
  final bool primary;
  final bool reverse;

  final IndexedWidgetBuilder separatorBuilder;

  @override
  Widget build(BuildContext context) {
    final TimelineThemeData timelineTheme = TimelineTheme.of(context);

    return ListView.separated(
      padding: padding,
      separatorBuilder: separatorBuilder ??
          (_, __) => Divider(
                color: const Color(0xFFB0BEC5),
                indent: 50.0,
                endIndent: 5.0,
                thickness: 0.8,
              ),
      physics: physics,
      shrinkWrap: shrinkWrap,
      itemCount: itemCount,
      controller: controller,
      reverse: reverse,
      primary: primary,
      itemBuilder: (context, index) {
        final event = events[index];

        Widget indicator;

        if (event.indicator != null) {
          indicator = event.indicator;
        }

        final isFirst = index == 0;
        final isLast = index == itemCount - 1;

        final timelineTile = <Widget>[
          if (event.hasIndicator)
            _buildIndicator(
                isFirst: isFirst,
                isLast: isLast,
                child: indicator,
                theme: timelineTheme),
          if (event.hasIndicator) SizedBox(width: timelineTheme.gutterSpacing),
          Expanded(child: event.child),
        ];

        return IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children:
                isLeftAligned ? timelineTile : timelineTile.reversed.toList(),
          ),
        );
      },
    );
  }

  Widget _buildIndicator(
      {bool isFirst, bool isLast, Widget child, TimelineThemeData theme}) {
    //    return
    var line = CustomPaint(
      painter: _LineIndicatorPainter(
        hideDefaultIndicator: child != null,
        lineColor: theme.lineColor,
        indicatorSize: indicatorSize,
        isFirst: isFirst,
        isLast: isLast,
        lineGap: theme.lineGap,
        strokeCap: theme.strokeCap,
        strokeWidth: theme.strokeWidth,
        style: theme.style,
        itemGap: theme.itemGap,
      ),
//      size: const Size(double.infinity, double.infinity),
      child: SizedBox(height: double.infinity, width: indicatorSize),
    );
    return Stack(
      children: [
        line,
        Align(
          child: SizedBox(
            width: indicatorSize,
            height: indicatorSize,
            child: child,
          ),
        )
      ],
    );
  }
}

class _LineIndicatorPainter extends CustomPainter {
  _LineIndicatorPainter({
    @required this.hideDefaultIndicator,
    @required this.indicatorSize,
    @required this.lineGap,
    @required this.strokeCap,
    @required this.strokeWidth,
    @required this.style,
    @required this.lineColor,
    @required this.isFirst,
    @required this.isLast,
    @required this.itemGap,
  }) : linePaint = Paint()
          ..color = lineColor
          ..strokeCap = strokeCap
          ..strokeWidth = strokeWidth
          ..style = style;

  final bool hideDefaultIndicator;
  final double indicatorSize;
  final double lineGap;
  final StrokeCap strokeCap;
  final double strokeWidth;
  final PaintingStyle style;
  final Color lineColor;
  final Paint linePaint;
  final bool isFirst;
  final bool isLast;
  final double itemGap;

  @override
  void paint(Canvas canvas, Size size) {
    final indicatorRadius = indicatorSize / 2;
    final indicatorMargin = indicatorRadius + lineGap;
    final safeItemGap = indicatorMargin + 0.0;

    final top = size.topLeft(Offset(indicatorRadius, 0.0 - safeItemGap));
    final centerTop = size.centerLeft(
      Offset(indicatorRadius, -indicatorMargin),
    );

    final bottom = size.bottomLeft(Offset(indicatorRadius, 0.0 + safeItemGap));
    final centerBottom = size.centerLeft(
      Offset(indicatorRadius, indicatorMargin),
    );

    if (!isFirst) canvas.drawLine(top, centerTop, linePaint);
    if (!isLast) canvas.drawLine(centerBottom, bottom, linePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

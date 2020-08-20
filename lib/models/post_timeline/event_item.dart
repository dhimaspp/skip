import 'package:flutter/material.dart';

class TimelineEventDisplay {
  TimelineEventDisplay(
      {@required @required this.child,
      this.indicator,
      this.forceLineDrawing = false});

  final Widget child;
  final Widget indicator;

  /// enables indicator line drawing even no indicator is passed.
  final bool forceLineDrawing;

  bool get hasIndicator {
    return indicator != null;
  }
}

class TimelineEventCard extends StatelessWidget {
  final Widget time;
  final Widget userName;
  final Widget activities;

  TimelineEventCard(
      {@required this.time,
      @required this.userName,
      @required this.activities});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: new BorderRadius.all(new Radius.circular(2.0)),
        ),
        child: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 10, top: 8, right: 16, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _userName(context),
                _time(context),
              ],
            ),
            SizedBox(
              height: 3,
            ),
            _activities(context),
          ],
        ));
  }

  Widget _time(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: DefaultTextStyle(
          style: Theme.of(context).textTheme.subtitle1, child: time),
    );
  }

  Widget _userName(BuildContext context) {
    return DefaultTextStyle(
        style: Theme.of(context).textTheme.subtitle2, child: userName);
  }

  Widget _activities(BuildContext context) {
    return DefaultTextStyle(
        style: Theme.of(context).textTheme.caption, child: activities);
  }
}

class TimelineSectionDivider extends StatelessWidget {
  final Widget time;

  factory TimelineSectionDivider.byDate(DateTime date) {
    return TimelineSectionDivider(
      time: Text("$date"),
    );
  }

  const TimelineSectionDivider({Key key, @required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _content(context);
  }

  Widget _content(BuildContext context) {
    return AnimatedDefaultTextStyle(
        child: time,
        style: Theme.of(context).textTheme.subtitle1,
        duration: kThemeChangeDuration);
  }
}

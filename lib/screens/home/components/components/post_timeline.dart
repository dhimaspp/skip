import 'package:flutter/material.dart';
import 'package:skip/constants.dart';
import 'package:flutter_timeline/flutter_timeline.dart';
import 'package:flutter_timeline/timeline.dart';
import 'package:flutter_timeline/timeline_theme_data.dart';

class PostTimeline extends StatefulWidget {
  @override
  _PostTimelineState createState() => _PostTimelineState();
}

class _PostTimelineState extends State<PostTimeline> {
  @override
  void initState() {
    super.initState();
    events = [
      plainEventDisplay,
      TimelineEventDisplay(
          child: Card(
        child: TimelineEventCard(
          title: Text("click the + button"),
          content: Text("to add a new event item"),
        ),
      )),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return _buildTimeline();
  }

  TimelineEventDisplay get plainEventDisplay {
    return TimelineEventDisplay(
        child: TimelineEventCard(
          title: Text("just now"),
          content: Text("Datang ke Resto jam ${DateTime.now()}"),
        ),
        indicator: TimelineDots.of(context).circleIcon);
  }

  List<TimelineEventDisplay> events;

  Widget _buildTimeline() {
    return TimelineTheme(
        data: TimelineThemeData(lineColor: Colors.blueAccent),
        child: Timeline(
          indicatorSize: 56,
          events: events,
        ));
  }
}

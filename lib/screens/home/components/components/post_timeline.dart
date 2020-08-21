import 'package:flutter/material.dart';
import 'package:skip/constants.dart';
import 'package:skip/models/post_timeline/event_item.dart';
import 'package:skip/models/post_timeline/flutter_timeline.dart';
import 'package:skip/models/post_timeline/timeline_theme.dart';

class PostTimeline extends StatefulWidget {
  @override
  _PostTimelineState createState() => _PostTimelineState();
}

class _PostTimelineState extends State<PostTimeline> {
  @override
  void initState() {
    super.initState();
    events = [
      post,
      TimelineEventDisplay(
          child: Card(
        child: TimelineEventCard(
          time: Text("33 min ago"),
          userName: Text("Lita"),
          activities: Text("Makan di Fortune Cafe juga"),
        ),
      )),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildTimeline(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kMaincolor.withOpacity(0.8),
        elevation: 0.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(45))),
        onPressed: _addEvent,
        tooltip: 'add new event',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }

  TimelineEventDisplay get post {
    return TimelineEventDisplay(
        child: TimelineEventCard(
          time: Text("23 min ago"),
          userName: Text("Dhimaspp"),
          activities: Text("Makan di Fortune Cafe"),
        ),
        indicator: TimelineDots.of(context).circleIcon);
  }

  List<TimelineEventDisplay> events;

  Widget _buildTimeline() {
    return TimelineTheme(
        data: TimelineThemeData(),
        child: Timeline(
          indicatorSize: 56,
          events: events,
        ));
  }

  void _addEvent() {
    setState(() {
      events.add(post);
    });
  }
}

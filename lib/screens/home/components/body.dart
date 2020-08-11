import 'package:flutter/material.dart';
import 'package:skip/screens/home/components/components/post_timeline.dart';
import 'package:skip/screens/home/components/components/second_bar.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: Column(
            children: <Widget>[SecondBar()],
          ),
        ),
        Divider(),
        Container(
          child: PostTimeline(),
        ),
      ],
    );
  }
}

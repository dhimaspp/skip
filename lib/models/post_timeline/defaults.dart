import 'package:flutter/material.dart';
import 'package:skip/constants.dart';

class TimelineDots {
  TimelineDots({this.context});

  BuildContext context;

  factory TimelineDots.of(BuildContext context) {
    return TimelineDots(context: context);
  }

  Widget get icon {
    return Icon(Icons.event);
  }

  Widget get circleIcon {
    return Container(
      width: 12,
      height: 12,
      child: Icon(
        Icons.event,
        color: Colors.white,
        size: 20,
      ),
      decoration: BoxDecoration(
          color: kMaincolor,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          border: Border.all(color: Colors.transparent)),
    );
  }
}

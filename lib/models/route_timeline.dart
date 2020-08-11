import 'package:flutter/material.dart';
import 'package:skip/screens/home/components/components/trial_timeline/cms_comments.dart';
import 'package:skip/screens/home/components/components/trial_timeline/plain_timeline.dart';

class Screen {
  Screen(
      {@required this.name,
      @required this.description,
      @required this.cover,
      @required this.route});

  final String name;
  final String description;
  final String cover;
  final String route;
}

Screen screennya;
List<Screen> screens = [
  Screen(
      name: "plain timeline",
      description: "simplest timeline demo",
      cover: null,
      route: PlainTimelineScreen.routeName),
  Screen(
      name: "cms / e-commerce with comments",
      description: "demo for creating timeline such like shopify",
      cover: null,
      route: CmsCommentsScreen.routeName),
  Screen(
      name: "plain timeline",
      description: "simplest timeline demo",
      cover: null,
      route: PlainTimelineScreen.routeName),
];

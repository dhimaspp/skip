import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skip/skip_tab_Bar.dart';
import 'package:skip/screens/home/components/components/trial_timeline/timeline.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Skip App',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SkipTabBar(),
      routes: {
        PlainTimelineScreen.routeName: (c) => PlainTimelineScreen(),
        CmsCommentsScreen.routeName: (c) => CmsCommentsScreen()
      },
    );
  }
}

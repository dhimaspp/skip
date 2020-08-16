import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skip/skip_tab_Bar.dart';

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
      // ignore: missing_required_param
      home: SkipTabBar(),
    );
  }
}

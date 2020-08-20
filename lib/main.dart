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
        textTheme: TextTheme(
            subtitle1: TextStyle(
                fontFamily: "Ambit",
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: Colors.grey),
            subtitle2: TextStyle(
                fontFamily: "Ambit",
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black),
            caption: TextStyle(
                fontFamily: "Ambit",
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.black)),
      ),
      // ignore: missing_required_param
      home: SkipTabBar(),
    );
  }
}

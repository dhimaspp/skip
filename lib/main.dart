import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skip/constants.dart';
import 'package:skip/screens/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
                color: Colors.black),
            headline3: TextStyle(
                fontFamily: "Ambit",
                fontSize: 72,
                fontWeight: FontWeight.w600,
                color: kMaincolor),
            headline4: TextStyle(
                fontFamily: "Ambit",
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: kMaincolor)),
      ),
      // ignore: missing_required_param
      home: Wrapper(),
    );
  }
}

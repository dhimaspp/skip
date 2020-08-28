import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:skip/constants.dart';
import 'package:skip/models/user.dart';
import 'package:skip/screens/wrapper.dart';
import 'package:skip/services/auth.dart';
import 'package:skip/services/exception_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<AuthResultStatus>.value(
      value: AuthService().streamStatus,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Skip App',
        theme: ThemeData(
          primaryColor: kMaincolor,
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
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skip/screens/authenticate/loginScreen.dart';
import 'package:skip/services/exception_handler.dart';
import 'package:skip/skip_tab_Bar.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final status = Provider.of<AuthResultStatus>(context);
    print(status);

    //return either home or authenticate widget
    if (status != AuthResultStatus.successful) {
      return LoginScreen();
    } else {
      return SkipTabBar();
    }
  }
}

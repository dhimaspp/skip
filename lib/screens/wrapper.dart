import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skip/models/user.dart';
import 'package:skip/screens/authenticate/authenticate.dart';
import 'package:skip/skip_tab_Bar.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users>(context);
    print(user);

    //return either home or authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return SkipTabBar();
    }
  }
}

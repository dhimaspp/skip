import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skip/constants.dart';
import 'package:skip/screens/home/components/body.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 2,
          leading: Container(
            margin: EdgeInsets.only(left: 5, bottom: 5, right: 0),
            child: SvgPicture.asset("assets/icons/skip-logo.svg"),
          ),
          centerTitle: false,
          title: new Text(
            "Skip.",
            style: TextStyle(
              fontFamily: "Ambit",
              fontSize: 24,
              fontWeight: FontWeight.w300,
              color: kMaincolor,
              letterSpacing: -1,
            ),
          ),
          actions: [
            Container(
              height: 33,
              width: 45,
              child: IconButton(
                padding: EdgeInsets.only(right: 20),
                icon: SvgPicture.asset("assets/icons/message.svg"),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
      body: Body(),
    );
  }
}

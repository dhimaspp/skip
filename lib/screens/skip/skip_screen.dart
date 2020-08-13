import 'package:flutter/material.dart';

class SkipScreen extends StatefulWidget {
  @override
  _SkipScreenState createState() => _SkipScreenState();
}

class _SkipScreenState extends State<SkipScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Skip Screen"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text("Skip Screen"),
      ),
    );
  }
}

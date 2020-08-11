import 'package:flutter/material.dart';
import 'package:skip/screens/home/home_screen.dart';

class SavedScreen extends StatefulWidget {
  @override
  _SavedScreenState createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Saved Screen"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text("Saved Screen"),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:skip/screens/home/home_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Search Screen"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text("Search Screen"),
      ),
    );
  }
}

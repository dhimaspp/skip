import 'package:flutter/material.dart';
import 'package:skip/constants.dart';
import 'package:skip/models/skip_app_icons.dart';
import 'package:skip/screens/home/home_screen.dart';
import 'package:skip/screens/profile/profile_screen.dart';
import 'package:skip/screens/saved/saved_screen.dart';
import 'package:skip/screens/search/search_screen.dart';
import 'package:skip/screens/skip/skip_screen.dart';

class SkipTabBar extends StatefulWidget {
  final _callback;

  SkipTabBar({@required void addEventCallback()})
      : _callback = addEventCallback;

  @override
  _SkipTabBarState createState() => _SkipTabBarState();
}

class _SkipTabBarState extends State<SkipTabBar>
    with SingleTickerProviderStateMixin {
  List<Widget> screens = [
    // ignore: missing_required_param
    HomeScreen(),
    SearchScreen(),
    SkipScreen(),
    SavedScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: TabBarView(
          children: screens,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: kMaincolor.withOpacity(0.8),
          elevation: 0.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(45))),
          onPressed: () {
            widget?._callback();
          },
          tooltip: 'add new event',
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        bottomNavigationBar: Container(
          height: 42,
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            new BoxShadow(
              offset: Offset(20, 20),
              blurRadius: 12,
              color: Colors.black,
              spreadRadius: 7,
            )
          ]),
          child: new TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.dashboard),
                //text: "Beranda",
              ),
              Tab(
                icon: Icon(Icons.search),
                //text: "Cari",
              ),
              Tab(
                icon: Icon(SkipAppIcon.skip_bar),
                //text: "Skip",
              ),
              Tab(
                icon: Icon(Icons.turned_in_not),
                //text: "Favorit",
              ),
              Tab(
                icon: Icon(Icons.person_outline),
                //text: "Profil",
              ),
            ],
            indicatorColor: kMaincolor,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: kMaincolor,
            ),
            labelColor: Colors.white,
            unselectedLabelColor: kMaincolor,
          ),
        ),
      ),
    );
  }
}

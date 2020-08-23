import 'package:flutter/material.dart';
import 'package:skip/constants.dart';
import 'package:skip/models/skip_app_icons.dart';
import 'package:skip/screens/authenticate/LoginTab.dart';
import 'package:skip/screens/authenticate/signUpTab.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  List<Tab> tabList = List();
  TabController _tabController;
  @override
  void initState() {
    tabList.add(new Tab(
      text: 'Login',
    ));
    tabList.add(new Tab(
      text: 'Daftar',
    ));
    _tabController = new TabController(vsync: this, length: tabList.length);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      SkipAppIcon.skip_bar,
                      color: kMaincolor,
                      size: 30,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text("Skip.",
                          style: Theme.of(context)
                              .textTheme
                              .headline3
                              .copyWith(letterSpacing: -6)),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 2,
                color: Colors.grey.withOpacity(0.3),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  new Container(
                    decoration: new BoxDecoration(
                      color: Colors.white,
                    ),
                    child: new TabBar(
                        labelStyle: Theme.of(context)
                            .textTheme
                            .caption
                            .copyWith(fontSize: 18),
                        labelColor: kMaincolor,
                        unselectedLabelColor: kMaincolor.withOpacity(0.5),
                        unselectedLabelStyle: Theme.of(context)
                            .textTheme
                            .caption
                            .copyWith(fontSize: 18),
                        controller: _tabController,
                        indicatorColor: kMaincolor,
                        indicatorSize: TabBarIndicatorSize.tab,
                        tabs: tabList),
                  ),
                  Container(
                    height: 500.0 + MediaQuery.of(context).padding.bottom,
                    child: new TabBarView(
                      controller: _tabController,
                      children: <Widget>[
                        LoginTab(),
                        SignUpTab(),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

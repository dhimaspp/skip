import 'package:flutter/material.dart';
import 'package:skip/services/auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text("Skip",
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      .copyWith(letterSpacing: -6)),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 30),
              child:
                  Text("Login", style: Theme.of(context).textTheme.headline4),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
              child: RaisedButton(
                  child: Text("Login Anonim"),
                  onPressed: () async {
                    dynamic result = await _auth.signInAnonim();
                    if (result == null) {
                      print("Error Login");
                    } else {
                      print("Login Sukses");
                      print(result.uid);
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}

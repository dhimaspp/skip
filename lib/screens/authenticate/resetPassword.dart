import 'package:flutter/material.dart';
import 'package:skip/models/skip_app_icons.dart';
import 'package:skip/services/auth.dart';

import '../../constants.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final AuthService _auth = AuthService();

  //text field state
  String password;
  String error = "";
  @override
  Widget build(BuildContext konteks) {
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 60),
                child: Form(
                    child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        decoration: textInputDecoration.copyWith(
                            hintText: "Password",
                            suffixIcon: Icon(
                              Icons.lock,
                              color: kMaincolor,
                            )),
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            .copyWith(fontSize: 18, color: kMaincolor),
                        textAlignVertical: TextAlignVertical.bottom,
                        validator: (val) => val.length < 6
                            ? "Password harus 6+ karakter "
                            : null,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                        obscureText: true,
                      ),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(
                            hintText: "Konfirmasi Password",
                            suffixIcon: Icon(
                              Icons.lock,
                              color: kMaincolor,
                            )),
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            .copyWith(fontSize: 18, color: kMaincolor),
                        textAlignVertical: TextAlignVertical.bottom,
                        validator: (val) {
                          if (val.isEmpty)
                            return "konfirmasi password belum terisi";
                          if (val != password) return "Input tidak cocok";
                          return null;
                        },
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                        obscureText: true,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: RaisedButton(
                            color: kMaincolor.withOpacity(0.5),
                            child: Text(
                              "Login",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () async {
                              await _auth.sendPasswordResetEmailReq(password);
                            }),
                      ),
                    ],
                  ),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

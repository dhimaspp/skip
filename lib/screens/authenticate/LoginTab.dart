import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skip/models/loading.dart';
import 'package:skip/screens/authenticate/resetPassword.dart';
import 'package:skip/services/auth.dart';
import 'package:skip/services/exception_handler.dart';

import '../../constants.dart';

class LoginTab extends StatefulWidget {
  @override
  _LoginTabState createState() => _LoginTabState();
}

class _LoginTabState extends State<LoginTab> {
  final AuthService _auth = AuthService();
  bool loading = false;
  //text field state
  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 60),
      child: Form(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              loading ? _loading() : SizedBox(height: 50),
              SizedBox(height: 12),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
              TextFormField(
                decoration: textInputDecoration.copyWith(
                    hintText: "Email",
                    suffixIcon: Icon(
                      Icons.email,
                      color: kMaincolor,
                    )),
                style: Theme.of(context)
                    .textTheme
                    .caption
                    .copyWith(fontSize: 18, color: kMaincolor),
                textAlignVertical: TextAlignVertical.bottom,
                validator: (val) => val.isEmpty ? "Masukan email kamu" : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
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
                validator: (val) =>
                    val.length < 6 ? "Password harus 6+ karakter " : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
                obscureText: true,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: RaisedButton(
                    color: kMaincolor,
                    child: Text(
                      "Login",
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(color: Colors.white, fontSize: 15),
                    ),
                    onPressed: () async {
                      {
                        setState(() => loading = true);
                        final status = await _auth.loginWithEmailAndPassword(
                            email, password);
                        if (status != AuthResultStatus.successful) {
                          setState(() {
                            error =
                                AuthExceptionHandler.generateExceptionMessage(
                                    status);
                            loading = false;
                          });
                        }
                      }
                    }),
              ),
              FlatButton(
                child: Text("Lupa password?"),
                onPressed: () {
                  setState(() {
                    _resetAlert();
                  });
                },
              ),
              Text("Atau"),
              SizedBox(height: 20),
              OutlineButton(
                onPressed: () {
                  _auth
                      .loginWithGoogle()
                      .whenComplete(() => AuthResultStatus.successful);
                },
                splashColor: Colors.grey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                highlightElevation: 0,
                borderSide: BorderSide(color: Colors.grey),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SvgPicture.asset("assets/icons/Google__G__Logo.svg",
                          height: 35),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Login dengan Google",
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              .copyWith(fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _loading() {
    return SpinKitPulse(
      color: kSecondaryColor,
      size: 50,
    );
  }

  Future _resetAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Reset Password"),
            content:
                new Text("Apakah anda yakin ingin melanjutkan reset password?"),
            actions: <Widget>[
              FlatButton(
                  color: Colors.transparent,
                  child: Text(
                    "Lanjut",
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith(color: kMaincolor, fontSize: 15),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
              FlatButton(
                  color: Colors.transparent,
                  splashColor: kSecondaryColor,
                  child: Text(
                    "Batal",
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith(color: kMaincolor, fontSize: 15),
                  ),
                  onPressed: () async {
                    Navigator.of(context).pop();
                  }),
            ],
          );
        });
  }
}

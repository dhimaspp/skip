import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:skip/services/auth.dart';
import 'package:skip/services/exception_handler.dart';

import '../../constants.dart';

class SignUpTab extends StatefulWidget {
  @override
  _SignUpTabState createState() => _SignUpTabState();
}

class _SignUpTabState extends State<SignUpTab> {
  final AuthService _auth = AuthService();
  bool loading = false;
  //text field state
  String email;
  String password;
  String confirmPassword;
  String error = " ";

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
                  if (val != password) return "Password tidak cocok";
                  return null;
                },
                onChanged: (val) {
                  setState(() => confirmPassword = val);
                },
                obscureText: true,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: RaisedButton(
                    color: kMaincolor,
                    child: Text(
                      "Daftar",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      {
                        setState(() => loading = true);
                        if (password != confirmPassword) {
                          setState(() {
                            error = "Konfirmasi password tidak cocok";
                            loading = false;
                          });
                        } else {
                          final status = await _auth
                              .registerWithEmailAndPassword(email, password);
                          if (status != AuthResultStatus.successful) {
                            setState(() {
                              error =
                                  AuthExceptionHandler.generateExceptionMessage(
                                      status);
                              loading = false;
                            });
                          }
                        }
                      }
                    }),
              ),
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
}

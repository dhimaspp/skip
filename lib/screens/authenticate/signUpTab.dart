import 'package:flutter/material.dart';
import 'package:skip/services/auth.dart';

import '../../constants.dart';

class SignUpTab extends StatefulWidget {
  @override
  _SignUpTabState createState() => _SignUpTabState();
}

class _SignUpTabState extends State<SignUpTab> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //text field state
  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 60),
      child: Form(
        key: _formKey,
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                validator: (val) => val.isEmpty ? "Masukan email kamu" : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              TextFormField(
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
                    color: kMaincolor.withOpacity(0.5),
                    child: Text(
                      "Daftar",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        dynamic result = await _auth
                            .registerWithEmailAndPassword(email, password);
                        if (result == null) {
                          setState(
                              () => error = "Tolong masukan email yang benar");
                        }
                      }
                    }),
              ),
              SizedBox(height: 12),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

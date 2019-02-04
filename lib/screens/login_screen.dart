import 'package:flutter/material.dart';
import 'package:gift_organiser/utils/base_auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _error;
  Auth auth = Auth();

  @override
  void initState() {
    auth.getCurrentUser().then((user) {
      if (user != null) {
        goToHomeScreen();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          alignment: Alignment.center,
          width: 300,
          height: 400,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.blue[200],
              boxShadow: [
                BoxShadow(
                    blurRadius: 25,
                    offset: Offset(10, 10),
                    color: Colors.grey[400])
              ]),
          child: Center(
            child: Column(
              children: [
                Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 30.0),
                    child: Image.asset(
                      'assets/images/login_avatar.png',
                      scale: 1.5,
                    )),
                RaisedButton.icon(
                  label: Padding(
                      padding: EdgeInsets.only(right: 40),
                      child: Text("Login with Google")),
                  icon: Padding(
                    padding: EdgeInsets.all(16),
                    child: Image.asset(
                      'assets/images/google_icon.png',
                      width: 24,
                      height: 24,
                    ),
                  ),
                  onPressed: handleSignIn,
                  color: Colors.white,
                ),
                Container(
                    margin: EdgeInsets.all(16.0),
                    child: Visibility(
                        visible: _error != null,
                        child: Text(_error == null ? '' : _error,
                            style: TextStyle(color: Colors.redAccent))))
              ],
            ),
          ),
        ),
      ),
    );
  }

  handleSignIn() {
      goToHomeScreen();
  }

  void goToHomeScreen() {
    Navigator.pushReplacementNamed(context, '/home');
  }
}

import 'package:flutter/material.dart';
import 'package:gift_organiser/utils/base_auth.dart';

class Settings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SettingsState();
  }
}

class _SettingsState extends State<Settings> {
  String _name = '';
  String _email = '';

  @override
  void initState() {
    var auth = Auth();
    auth.getCurrentUser().then((user) {
      if (user != null) {
        setState(() {
          _email = user.email;
          _name = user.displayName;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Stack(
        children: <Widget>[
          Positioned(
            child: Container(
              decoration: BoxDecoration(color: Colors.blue),
              height: 300.0,
            ),
          ),
          Positioned(
            child: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/avatar.png',
                  width: 200,
                  height: 200,
                )),
            width: 400,
            height: 300,
          ),
        ],
      ),
      Align(
          alignment: Alignment.centerLeft,
          child: Padding(
              padding: EdgeInsets.only(top: 10.0, left: 20.0),
              child: Text(
                "User: " + _name,
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.left,
              ))),
      Align(
          alignment: Alignment.centerLeft,
          child: Padding(
              padding: EdgeInsets.only(top: 10.0, left: 20.0),
              child: Text(
                "Email: " + _email,
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.left,
              ))),
      Padding(
        padding: EdgeInsets.all(20.0),
        child: MaterialButton(
            child: Text(
              "Log out",
              style: TextStyle(fontSize: 18.0),
            ),
            color: Theme.of(context).primaryColor,
            textColor: Colors.white,
            onPressed: logOut,
            minWidth: 400),
      )
    ]);
  }

  void logOut() {
    Auth().signOut();
    Navigator.pushReplacementNamed(context, '/login');
  }
}

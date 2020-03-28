import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../UserState.dart';

class StartUp extends StatefulWidget {
  @override
  _StartUpState createState() => _StartUpState();
}

class _StartUpState extends State<StartUp> {
  void loadUser() async {
    //Todo: Load User here and put values in the userstate
    UserState().username = "Hans12";
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, "/feeling");
    });
  }

  void loadState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool registered = (prefs.getBool("REGISTERED") ?? false);

    if (registered) {
      loadUser();
    } else {
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushReplacementNamed(context, "/register");
      });
    }
  }

  @override
  void initState() {
    super.initState();

    loadState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Stay Happy @ Home"),
            Text("😀😷🐼",
              style: TextStyle(
                  fontSize: 50
              ),),
          ],
        ),
      ),
    );
  }
}

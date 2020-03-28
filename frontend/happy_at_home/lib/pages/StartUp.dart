import 'package:flutter/material.dart';
import 'package:happyathome/usecases/UserRegistration.dart';

import '../UserState.dart';

class StartUp extends StatefulWidget {
  @override
  _StartUpState createState() => _StartUpState();
}

class _StartUpState extends State<StartUp> {

  void _loadUser() async {
    UserState().user = await UserRegistration.load();
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, "/feeling");
    });
  }

  void loadState() async {
    final registered = await UserRegistration.hasRegisteredUser();
    if (registered) {
      try {
        _loadUser();
      } catch (e) {
        print("Warning, can not load user: $e");
        _register();
      }
    } else {
      _register();
    }
  }

  void _register() {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, "/register");
    });
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
            Text(
              "😀😷🐼",
              style: TextStyle(fontSize: 50),
            ),
            Image(image: AssetImage("assets/emoji/laughing.png")),
          ],
        ),
      ),
    );
  }
}

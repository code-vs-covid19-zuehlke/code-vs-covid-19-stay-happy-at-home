import 'package:flutter/material.dart';

class StartUp extends StatefulWidget {
  @override
  _StartUpState createState() => _StartUpState();
}

class _StartUpState extends State<StartUp> {
  void loadUser() async {
    //Todo: Load User here
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, "/feeling");
    });
  }

  @override
  void initState() {
    super.initState();
    //Todo: Check here if user is already registered
    var userRegistered = false;
    if (userRegistered) {
      loadUser();
    } else {
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushReplacementNamed(context, "/profile");
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Center(
        child: Text("Stay Happy @ Home"),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class StartUp extends StatefulWidget {
  @override
  _StartUpState createState() => _StartUpState();
}

class _StartUpState extends State<StartUp> {
  void loadUser() async {
    //Todo: Load User here
    Navigator.pushReplacementNamed(context, "/feeling");
  }

  @override
  void initState() {
    super.initState();
    var userRegistered = true;
    if (userRegistered) {
      loadUser();
    } else {
      Navigator.pushReplacementNamed(context, "/profile");
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

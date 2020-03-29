import 'package:flutter/material.dart';
import 'package:happyathome/usecases/UserRegistration.dart';
import 'package:happyathome/widgets/CustomColors.dart';

import '../UserState.dart';

class StartUp extends StatefulWidget {
  @override
  _StartUpState createState() => _StartUpState();
}

class _StartUpState extends State<StartUp> {

  Future<void> _loadUser() async {
    UserState().user = await UserRegistration.load();
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, "/feeling");
    });
  }

  void loadState() async {
    final registered = await UserRegistration.hasRegisteredUser();
    if (registered) {
      try {
        await _loadUser();
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
      backgroundColor: CustomColors.BackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Stay Happy @ Home"),
            Text(
              "😀😷🐼",
              style: TextStyle(fontSize: 50),
            ),
            Image(image: AssetImage("assets/emoji/face_with_tears_of_joy.png")),
          ],
        ),
      ),
    );
  }
}

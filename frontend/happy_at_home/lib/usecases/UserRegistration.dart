import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happyathome/apis/Backend.dart';
import 'package:happyathome/models/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRegistration {
  static final userRegistered = "USER_REGISTERED";
  static final userId = "USER_ID";

  static Future<bool> hasRegisteredUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final registered = prefs.getBool(userRegistered) ?? false;
    return registered;
  }

  static Future<User> load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return Backend.getUserById(prefs.getString(userId));
  }

  static Future<User> register(String userName) async {
    final user = await Backend.postUser(User.createUser(userName));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(userRegistered, true);
    await prefs.setString(userId, user.id);
    return user;
  }

  static void unregister(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(userRegistered, false);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Bye bye"),
          content: new Text("Now closing the app ;)"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              },
            ),
          ],
        );
      },
    );
  }
}

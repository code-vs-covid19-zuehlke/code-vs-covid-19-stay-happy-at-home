import 'package:flutter/material.dart';
import 'package:happyathome/apis/Backend.dart';
import 'package:happyathome/models/User.dart';
import 'package:happyathome/usecases/UserRegistration.dart';
import 'package:happyathome/widgets/CustomColors.dart';
import 'package:happyathome/widgets/UserWidget.dart';

import '../UserState.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Future<User> futureUser;

  @override
  void initState() {
    super.initState();
    futureUser = Backend.getUserById(UserState().user.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.BackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: <Widget>[
                UserWidget(Backend.getUserById(UserState().user.id)),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Reactions received", style: TextStyle(
                            fontSize: 24, fontFamily: "Comfortaa")),
                        Row(
                          children: <Widget>[
                            Image.asset(
                              "assets/emoji/panda.png",
                              scale: 5,
                            ),
                            Text("12"),
                            SizedBox(width: 10),
                            Image.asset(
                              "assets/emoji/drooling_face.png",
                              scale: 5,
                            ),
                            Text("27"),
                          ],
                        ),
                        SizedBox(height: 32),
                        Text("Reactions given", style: TextStyle(fontSize: 24,
                            fontFamily: "Comfortaa")),
                        Row(children: <Widget>[
                          Image.asset(
                            "assets/emoji/pile_of_poo.png",
                            scale: 5,
                          ),
                          Text("11"),
                        ]),
                      ],
                    ),
                  ),
                ),
                FlatButton.icon(
                  onPressed: () => _refresh(),
                  label: Text(
                    "Refresh",
                    style: TextStyle(
                        fontFamily: "Comfortaa"
                    ),
                  ),
                  icon: Icon(
                    Icons.refresh,
                    color: Colors.blue,
                  ),
                ),
                FlatButton.icon(
                  onPressed: () => UserRegistration.unregister(context),
                  label: Text(
                    "Unregister",
                    style: TextStyle(
                        fontFamily: "Comfortaa"
                    ),
                  ),
                  icon: Icon(
                    Icons.delete,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _refresh() async {
    setState(() {
      futureUser = Backend.getUserById(UserState().user.id);
    });
  }
}

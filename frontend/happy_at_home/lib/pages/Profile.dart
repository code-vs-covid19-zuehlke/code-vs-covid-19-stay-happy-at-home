import 'package:flutter/material.dart';
import 'package:happyathome/apis/Backend.dart';
import 'package:happyathome/models/User.dart';
import 'package:happyathome/usecases/UserRegistration.dart';
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
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              UserWidget(Backend.getUserById(UserState().user.id)),
              Text("Reactions received", style: TextStyle(fontSize: 24)),
              Text("Reactions given", style: TextStyle(fontSize: 24)),
              FlatButton.icon(
                onPressed: () => _refresh(),
                label: Text(
                  "Refresh",
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
    );
  }

  void _refresh() async {
    setState(() {
      futureUser = Backend.getUserById(UserState().user.id);
    });
  }
}

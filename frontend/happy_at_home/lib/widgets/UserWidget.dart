import 'package:flutter/material.dart';
import 'package:happyathome/models/User.dart';
import 'package:happyathome/utils/GoogleCloudImage.dart';

class UserWidget extends StatelessWidget {
  final Future<User> futureUser;

  UserWidget(this.futureUser);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User>(
      future: futureUser,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(children: <Widget>[
            SizedBox(height: 15),
            CircleAvatar(
              backgroundImage: GoogleCloudImage.get(snapshot.data.photo),
              radius: 70,
            ),
            SizedBox(height: 15),
            Text(
              "${snapshot.data.name}",
              style: TextStyle(fontSize: 36, fontFamily: "Comfortaa"),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15),
          ]);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }
}

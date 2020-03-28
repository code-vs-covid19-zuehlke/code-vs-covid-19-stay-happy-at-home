import 'package:flutter/material.dart';
import 'package:happyathome/models/User.dart';

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
            Image.asset('assets/profile_picture.jpg'),
            Text(snapshot.data.name, style: TextStyle(fontSize: 36)),
            Text("Reactions received", style: TextStyle(fontSize: 24)),
            Text("Reactions given", style: TextStyle(fontSize: 24)),
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

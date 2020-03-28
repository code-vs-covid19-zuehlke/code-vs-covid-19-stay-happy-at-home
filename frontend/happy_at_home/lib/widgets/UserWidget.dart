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
            SizedBox(height: 15),
            Image.asset('assets/profile_picture.jpg'),
            SizedBox(height: 15),
            Text(snapshot.data.name, style: TextStyle(fontSize: 36)),
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

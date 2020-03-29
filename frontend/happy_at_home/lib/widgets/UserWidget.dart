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
          print(snapshot.data.photo);
          return Column(children: <Widget>[
            SizedBox(height: 15),
            CircleAvatar(
              backgroundImage: AssetImage('assets/profile_picture.jpg'),
              radius: 70,),
            SizedBox(height: 15),
            Text("Hi ${snapshot.data.name}", style: TextStyle(fontSize: 36,
                fontFamily: "Comfortaa")),
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

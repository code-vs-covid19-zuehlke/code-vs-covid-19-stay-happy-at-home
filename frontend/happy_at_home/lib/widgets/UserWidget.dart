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
              backgroundImage: NetworkImage(
                  "https://00e9e64bac2854bd20542f71cfdaf0d82dee646638bb717575-apidata.googleusercontent.com/download/storage/v1/b/stay-happy-at-home-eu-prod/o/user-b6bc40da-5146-4fb2-85ac-1720d1527a75?qk=AD5uMEtBXp4IXGvM3pas74tEqbIq_h-jnm-joiLGUuubR0Hqof0PbbXYIvGkJoFaHsEBniQYVH_CGQjyz8t_wwLl7EiZS4Kx_XbhguJSEt7WHPYVV8lgrnrb34eCV7hGJe8sk19y03PdWntrFjvDddloYoEnfD4aaAPFy2hXobg6RUPLHz2MRKwzIq4AA1vAIXGGdPGm_ZNd6EUXl8k1WC7gxu5tuRnZxqFYNhRVi7lv2MgppcAWdSi9s5i7THM5F0u71gmW1rIVwYnVbzRLqQTVw90r3Dpx4xR1bSrNo85YGwnIW3PQyJNraHG8Hbk6iIqYHybVkfq29g0QPLWh9bA0p-6PBF2kE8dpOzuFvsE5rLwnNGejjO4REVr293tXnIkOWCRbvsLSvGlmxUFuMzB5Wy6RRMFQo7JIVxpHn6iJx8sZe7WZR8RYHii3WOcUY7p27QwRiYgphZsRQn7ybsvv_6B4qM6fQg6O6VV1H4o1tQ_nAwaQQiLoNGEGSeXFOWhF6Z6bkS0VeWkKqFiMeful0YCrJipePbWZHxggRNAT1i4Vf8OAovnMnPxJVkJaCYzOWYqJoD-AxpNHSovbpbBZNmLpJfar8Chvqwtq-b8jnqvf06ysQlkZXhnIoH_3BP11uEi9XhMcHvz7bn4rxKAWVMYsGeuv2XSb0-MlRtfhGeMXVr6X2WmFGz85fkDpfTozrva2ASsvmYHL65pEFwiHlEJ1Fny8t8MwzEeu6rX5KjnOdPgwUsU_aN1SnCejS4esqKi7uwJ5xJyKCtyOQjn8-o5Z242J0dXg93D0A6Xc9zHdo6PjHr_9Jj7Sg0hJjl3abMWyGDcAdp3zNuziPf7K26H1FUu3TY3SyZitIjalHHIbqknvg0M&isca=1"),
              radius: 70,
            ),
            SizedBox(height: 15),
            Text("Hi ${snapshot.data.name}",
                style: TextStyle(fontSize: 36, fontFamily: "Comfortaa")),
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

import 'package:flutter/material.dart';
import 'package:happyathome/pages/ContentDetail.dart';
import 'package:happyathome/pages/ContentFeed.dart';
import 'package:happyathome/pages/CreateContent.dart';
import 'package:happyathome/pages/CurrentFeeling.dart';
import 'package:happyathome/pages/Profile.dart';
import 'package:happyathome/pages/Register.dart';
import 'package:happyathome/pages/StartUp.dart';

import 'apis/Backend.dart';
import 'main.reflectable.dart' show initializeReflectable;

void main() {
  initializeReflectable();
  Backend.init();
  runApp(MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => StartUp(),
        "/register": (context) => Register(),
        "/profile": (context) => Profile(),
        "/feed": (context) => ContentFeed(),
        "/feeling": (context) => CurrentFeeling(),
        "/detail": (context) => ContentDetail(),
        "/create": (context) => CreateContent(),
      }
  ));
}


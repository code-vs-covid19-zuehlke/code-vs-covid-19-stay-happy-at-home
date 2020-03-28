import 'package:flutter/material.dart';
import 'package:happyathome/pages/AcutalFeeling.dart';
import 'package:happyathome/pages/ContentDetail.dart';
import 'package:happyathome/pages/ContentFeed.dart';
import 'package:happyathome/pages/CreateContent.dart';
import 'package:happyathome/pages/Profile.dart';
import 'main.reflectable.dart' show initializeReflectable;

void main() {
  initializeReflectable();
  runApp(MaterialApp(initialRoute: "/", routes: {
    "/": (context) => Profile(),
    "/feed": (context) => ContentFeed(),
    "/feeling": (context) => ActualFeeling(),
    "/detail": (context) => ContentDetail(),
    "/create": (context) => CreateContent(),
  }));
}

import 'package:flutter/material.dart';
import 'package:happyathome/models/Emoji.dart';
import 'package:happyathome/usecases/UserRegistration.dart';
import 'package:happyathome/widgets/CustomColors.dart';
import 'package:happyathome/widgets/EmojiImage.dart';

import '../UserState.dart';

class StartUp extends StatefulWidget {
  @override
  _StartUpState createState() => _StartUpState();
}

class _StartUpState extends State<StartUp> {
  Future<void> _loadUser() async {
    UserState().user = await UserRegistration.load();
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, "/feeling");
    });
  }

  void loadState() async {
    final registered = await UserRegistration.hasRegisteredUser();
    if (registered) {
      try {
        await _loadUser();
      } catch (e) {
        print("Warning, can not load user: $e");
        _register();
      }
    } else {
      _register();
    }
  }

  void _register() {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, "/register");
    });
  }

  @override
  void initState() {
    super.initState();

    loadState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.BackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(width: 20,),
                      EmojiImage.ScaledEmojiImage(
                          Emoji.FACE_WITH_TEARS_OF_JOY, 1.5),
                      SizedBox(width: 100,),
                      EmojiImage.ScaledEmojiImage(Emoji.EXPLODING_HEAD, 1)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      EmojiImage.ScaledEmojiImage(Emoji.PANDA, 1),
                      SizedBox(height: 70, width: 130,),
                      EmojiImage.ScaledEmojiImage(
                          Emoji.HEAR_NO_EVIL_MONKEY, 2.5),
                      SizedBox(width: 30,)
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: Image(image: AssetImage("assets/logo.png"),)),
            Expanded(
              flex: 2,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      EmojiImage.ScaledEmojiImage(
                          Emoji.FACE_SCREAMING_IN_FEAR, 1.5),
                      SizedBox(width: 100,),
                      EmojiImage.ScaledEmojiImage(
                          Emoji.FACE_WITH_MEDICAL_MASK, 1)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(width: 50,),
                      EmojiImage.ScaledEmojiImage(Emoji.YAWNING_FACE, 1),
                      SizedBox(height: 70, width: 100,),
                      EmojiImage.ScaledEmojiImage(Emoji.NERD_FACE, 2.5),
                      SizedBox(width: 30,)
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

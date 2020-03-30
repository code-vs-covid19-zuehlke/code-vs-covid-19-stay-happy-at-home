import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:happyathome/usecases/UserRegistration.dart';
import 'package:happyathome/widgets/ButtonWidget.dart';
import 'package:happyathome/widgets/CustomColors.dart';
import 'package:happyathome/widgets/ImagePickerWebWidget.dart';
import 'package:happyathome/widgets/ImagePickerWidget.dart';
import 'package:happyathome/widgets/LoadingOverlayWidget.dart';
import 'package:happyathome/widgets/TitleCard.dart';

import '../UserState.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  File _image;
  Image _webImage;
  Uint8List _webImageRaw;
  bool loading = false;

  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final nameController = TextEditingController();

  void onChooseImage(image) {
    setState(() {
      _image = image;
    });
  }

  void onChooseWebImage(webImage, webImageRaw) {
    setState(() {
      _webImage = webImage;
      _webImageRaw = webImageRaw;
    });
  }

  void createUser() async {
    setState(() {
      loading = true;
    });
    var name = nameController.text;
    UserState().user = kIsWeb
        ? await UserRegistration.registerFromWeb(name, _webImageRaw)
        : await UserRegistration.register(name, _image);
    Navigator.pushReplacementNamed(context, "/feeling");
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.BackgroundColor,
      body: SafeArea(
        child: LoadingOverlayWidget(
          isLoading: loading,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TitleCard(
                  title: "Who are you?",
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: 'Nickname'),
                    ),
                  ),
                ),
                TitleCard(
                    title: _image == null ? "Upload Picture" : "Your Picture",
                    child: kIsWeb
                        ? ImagePickerWebWidget(_webImage, onChooseWebImage)
                        : ImagePickerWidget(context, _image, onChooseImage)),
                ButtonWidget(
                  onPress: createUser,
                  title: "Register now",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

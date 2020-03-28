import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImgWidget extends StatelessWidget {
  final File image;
  final Function onChooseImage;

  ProfileImgWidget(this.image, this.onChooseImage);

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    onChooseImage(image);
  }

  @override
  Widget build(BuildContext context) {
    return image == null
        ? Container(
            color: Colors.greenAccent,
      width: 250,
      height: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('No image selected.'),
                FlatButton.icon(
                  onPressed: getImage,
                  label: Text(
                    "Choose profile picture",
                  ),
                  icon: Icon(
                    Icons.add_a_photo,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          )
        : Container(
      width: 250,
      height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: FileImage(image),
                fit: BoxFit.cover,
              ),
            ),
          );
  }
}

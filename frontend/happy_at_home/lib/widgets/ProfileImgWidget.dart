import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImgWidget extends StatelessWidget {
  final File image;
  final Function onChooseImage;
  final BuildContext context;

  ProfileImgWidget(this.context, this.image, this.onChooseImage);

  Future getImage(isCamera) async {
    var image = isCamera
        ? await ImagePicker.pickImage(source: ImageSource.camera)
        : await ImagePicker.pickImage(source: ImageSource.gallery);
    onChooseImage(image);
  }

  void showModal() {
    showModalBottomSheet(
        isDismissible: true,
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.image),
                    title: new Text('Gallery'),
                    onTap: () async {
                      getImage(false);
                      Navigator.pop(context);
                    }),
                new ListTile(
                  leading: new Icon(Icons.camera_alt),
                  title: new Text('Camera'),
                  onTap: () async {
                    getImage(true);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        });
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
                  onPressed: showModal,
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

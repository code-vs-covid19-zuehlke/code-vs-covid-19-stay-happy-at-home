import 'dart:io';

import 'package:flutter/material.dart';
import 'package:happyathome/widgets/TitleCard.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatelessWidget {
  final File image;
  final Function onChooseImage;
  final BuildContext context;

  ImagePickerWidget(this.context, this.image, this.onChooseImage);

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
        ? TitleCard(
      title: "Upload Picture",
      child: FlatButton.icon(
        label: Text(""),
        onPressed: showModal,
        color: Colors.greenAccent,
        icon: Icon(
          Icons.file_upload,
          color: Colors.black,
          size: 70,
        ),
            ),
          )
        : TitleCard(
      title: "Your Picture",
      child: Container(
        height: 300,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: FileImage(image),
            fit: BoxFit.cover,
          ),
              ),
            ),
          );
  }
}

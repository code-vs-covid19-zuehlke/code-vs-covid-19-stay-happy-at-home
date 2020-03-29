import 'dart:io';

import 'package:flutter/material.dart';
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
        ? Center(
      child: Container(
        height: 100,
        width: 100,
        margin: const EdgeInsets.all(24),
        child: FlatButton(
          onPressed: showModal,
          color: Colors.greenAccent,
          child: Icon(
            Icons.file_upload,
            color: Colors.black,
            size: 70,
          ),
        ),
            ),
          )
        : Center(
      child: Container(
        height: 200,
        width: 200,
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

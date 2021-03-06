import 'package:flutter/material.dart';
import 'package:happyathome/widgets/image_getter/AbstractImageGetter.dart';

class ImagePickerWebWidget extends StatelessWidget {
  final Image image;
  final Function onChooseWebImage;

  ImagePickerWebWidget(this.image, this.onChooseWebImage);

  void getImage() async {
    var imageRaw = await AbstractImageGetter().getImage();
    var img = Image.memory(imageRaw, semanticLabel: "img");
    onChooseWebImage(img, imageRaw);
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
                onPressed: getImage,
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
            child: Container(height: 200, width: 200, child: image),
          );
  }
}

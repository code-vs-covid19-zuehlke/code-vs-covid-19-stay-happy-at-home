import 'dart:typed_data';

import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';

class FallbackImage {
  static Uint8List _imageBytes;
  static ImageProvider _imageProvider;

  static Future<Uint8List> bytes() async {
    if (_imageBytes == null) {
      _imageBytes = (await rootBundle.load('assets/profile_picture.jpg')).buffer.asUint8List();
    }
    return _imageBytes;
  }

  static ImageProvider provider() {
    if (_imageProvider == null) {
      _imageProvider = AssetImage('assets/profile_picture.jpg');
    }
    return _imageProvider;
  }
}

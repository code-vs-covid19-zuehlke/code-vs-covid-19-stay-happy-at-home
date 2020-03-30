import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:happyathome/apis/Backend.dart';
import 'package:happyathome/models/Emotion.dart';
import 'package:happyathome/models/Post.dart';
import 'package:happyathome/models/TargetFeeling.dart';
import 'package:happyathome/utils/FallbackImage.dart';

class PostCreation {
  static Future<Post> create(String title, String description, String link,
      File image, Set<Emotion> emotions, int requiredTime) async {
    Uint8List binaryData;
    if (image == null) {
      binaryData = await FallbackImage.bytes();
    } else {
      binaryData = await image.readAsBytes();
    }

    final post = await Backend.postPost(CreatePost(
        title,
        description,
        link,
        base64.encode(binaryData),
        "image/jpg",
        emotions.map((em) => TargetFeeling(em)).toSet(),
        requiredTime));
    return post;
  }

  static Future<Post> createFromWeb(String title, String description,
      String link,
      Uint8List image, Set<Emotion> emotions, int requiredTime) async {
    Uint8List binaryData;
    if (image == null) {
      binaryData = await FallbackImage.bytes();
    } else {
      binaryData = image;
    }

    final post = await Backend.postPost(CreatePost(title, description, link,
        base64.encode(binaryData), "image/jpg",
        emotions.map((em) => TargetFeeling(em)).toSet(), requiredTime));
    return post;
  }
}

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:happyathome/apis/Backend.dart';
import 'package:happyathome/models/Post.dart';
import 'package:happyathome/models/Reply.dart';
import 'package:happyathome/utils/FallbackImage.dart';

class ReplyCreation {
  static Future<Reply> create(Post post, String title, String description,
      String link, File image) async {
    Uint8List binaryData;
    if (image == null) {
      binaryData = await FallbackImage.bytes();
    } else {
      binaryData = await image.readAsBytes();
    }

    final reply = await Backend.postReply(
        post,
        CreateReply(
            title, description, link, base64.encode(binaryData), "image/jpg"));
    return reply;
  }

  static Future<Reply> createFromWeb(Post post, String title,
      String description,
      String link, Uint8List image) async {
    Uint8List binaryData;
    if (image == null) {
      binaryData = await FallbackImage.bytes();
    } else {
      binaryData = image;
    }

    final reply = await Backend.postReply(
        post,
        CreateReply(
            title, description, link, base64.encode(binaryData), "image/jpg"));
    return reply;
  }
}

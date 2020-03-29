import 'package:flutter/material.dart';
import 'package:happyathome/models/Emoji.dart';

class EmojiImage extends StatelessWidget {
  final Emoji emoji;

  EmojiImage(this.emoji);

  @override
  Widget build(BuildContext context) {
    return Image(
        image: AssetImage(
            "assets/emoji/${emoji.toString().split(".").last.toLowerCase()}.png"));
  }
}

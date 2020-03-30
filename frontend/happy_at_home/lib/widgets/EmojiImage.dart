import 'package:flutter/material.dart';
import 'package:happyathome/models/Emoji.dart';

class EmojiImage extends StatelessWidget {
  final Emoji emoji;
  double scale;

  EmojiImage(this.emoji);

  EmojiImage.ScaledEmojiImage(this.emoji, this.scale);

  @override
  Widget build(BuildContext context) {
    if (scale != null) {
      return Image.asset(
          "assets/emoji/${emoji
              .toString()
              .split(".")
              .last
              .toLowerCase()}.png",
          scale: scale);
    }

    return Image(
        image: AssetImage(
            "assets/emoji/${emoji.toString().split(".").last.toLowerCase()}.png"));
  }
}

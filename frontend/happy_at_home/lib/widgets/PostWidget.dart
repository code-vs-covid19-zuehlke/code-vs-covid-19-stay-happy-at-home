import 'package:flutter/material.dart';
import 'package:happyathome/models/Post.dart';
import 'package:happyathome/utils/GoogleCloudImage.dart';
import 'package:happyathome/widgets/PostRatingWidget.dart';

class PostWidget extends StatelessWidget {
  final Post post;
  final Function postSelected;

  PostWidget(this.post, this.postSelected);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        postSelected(post);
      },
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 1,
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                PostImage(post.picture, 7),
                SizedBox(width: 10,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      post.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(post.description),
                    PostRatingWidget(context, null, post, false),
                  ],
                ),
              ],
            ),

            SizedBox(
              width: 20,
            ),
            Icon(Icons.chevron_right)
          ],
        ),
      ),
    );
  }
}

class PostImage extends StatelessWidget {
  final int duration;
  final String photoUrl;

  PostImage(this.photoUrl, this.duration);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        CircleAvatar(
          backgroundImage: GoogleCloudImage.get(photoUrl),
          radius: 45,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.greenAccent,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${duration} MIN",
              style: TextStyle(
                fontFamily: "Comfortaa",
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

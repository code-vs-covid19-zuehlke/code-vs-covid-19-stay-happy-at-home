import 'package:flutter/material.dart';
import 'package:happyathome/models/Post.dart';
import 'package:happyathome/widgets/BottomBarWidget.dart';
import 'package:happyathome/widgets/CustomColors.dart';
import 'package:happyathome/widgets/ImagePickerWidget.dart';
import 'package:happyathome/widgets/PostRatingWidget.dart';
import 'package:happyathome/widgets/TimerWidget.dart';
import 'package:happyathome/widgets/TitleCard.dart';

class ContentDetail extends StatefulWidget {
  @override
  _ContentDetailState createState() => _ContentDetailState();
}

class _ContentDetailState extends State<ContentDetail> {
  String title = "Toilet paper towers wanted!";
  String description = "Where to store all the rolls?";
  Post post;

  @override
  Widget build(BuildContext context) {
    post ??= ModalRoute
        .of(context)
        .settings
        .arguments;

    return Scaffold(
      backgroundColor: CustomColors.BackgroundColor,
      body: SafeArea(
        child: TitleCard(
          title: title,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 400,
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    if (index < 1) {
                      return ReplyWidget(post);
                    } else {
                      return ImagePickerWidget(context, null, () {});
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ContentDetailBottomBar(),
    );
  }
}

class ReplyWidget extends StatelessWidget {
  Post post;

  ReplyWidget(this.post);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
      ),
      height: 150,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image(
                image: AssetImage(
                  "assets/profile_picture.jpg",
                ),
                height: 100,
              ),
              PostRatingWidget(context, null, post, true),
            ],
          ),
        ],
      ),
    );
  }
}

class ContentDetailBottomBar extends StatelessWidget {
  const ContentDetailBottomBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomBarWidget(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          TimerWidget(),
          RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Back",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.black,
          ),
          SizedBox(
            width: 50,
          ),
        ],
      ),
    );
  }
}

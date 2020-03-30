import 'package:flutter/material.dart';
import 'package:happyathome/apis/Backend.dart';
import 'package:happyathome/models/Emoji.dart';
import 'package:happyathome/models/Post.dart';
import 'package:happyathome/models/Reaction.dart';
import 'package:happyathome/models/Reply.dart';
import 'package:happyathome/usecases/ReplyCreation.dart';
import 'package:happyathome/utils/GoogleCloudImage.dart';
import 'package:happyathome/widgets/BottomBarWidget.dart';
import 'package:happyathome/widgets/CustomColors.dart';
import 'package:happyathome/widgets/ImagePickerWidget.dart';
import 'package:happyathome/widgets/NewUserWidget.dart';
import 'package:happyathome/widgets/PostRatingWidget.dart';
import 'package:happyathome/widgets/TimerWidget.dart';
import 'package:happyathome/widgets/TitleCard.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../UserState.dart';

class ContentDetail extends StatefulWidget {
  @override
  _ContentDetailState createState() => _ContentDetailState();
}

class _ContentDetailState extends State<ContentDetail> {
  Post post;

  RefreshController _refreshController =
  RefreshController(initialRefresh: false);

  void createReply(image) async {
    await ReplyCreation.create(post, "dummy", "dummy", null, image);
    reload();
  }

  List<Widget> createContent() {
    List<Widget> widgetList = List();
    widgetList.add(ReplyWidget(post, null, false, addReaction));
    for (Reply reply in post.replies) {
      widgetList.add(ReplyWidget(post, reply, true, addReaction));
    }
    widgetList.add(ImagePickerWidget(context, null, createReply));
    return widgetList;
  }

  void reload() async {
    Post post = await Backend.getPostById(this.post.id);
    setState(() {
      this.post = post;
    });
  }

  void onRefresh() async {
    reload();
    _refreshController.refreshCompleted();
  }

  void addReaction(Post post, Reply reply, Emoji reaction, bool isReply) async {
    if (isReply) {
      await Backend.postReactionToReply(post, reply, Reaction(reaction));
    } else {
      await Backend.postReactionToPost(post, Reaction(reaction));
    }
    reload();
  }

  @override
  Widget build(BuildContext context) {
    post ??= ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: CustomColors.BackgroundColor,
      body: SafeArea(
        child: SmartRefresher(
          enablePullDown: true,
          header: WaterDropMaterialHeader(),
          controller: _refreshController,
          onRefresh: onRefresh,
          child: TitleCard(
            title: post.title,
            subtitle: post.description,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 400,
                  child: ListView(
                    children: createContent(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: ContentDetailBottomBar(),
    );
  }
}

class ReplyWidget extends StatelessWidget {
  Post post;
  Reply reply;
  bool isReply;
  Function addReaction;

  ReplyWidget(this.post, this.reply, this.isReply, this.addReaction);

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image(
                image: GoogleCloudImage.get(
                    isReply ? reply.picture : post.picture),
                height: 100,
              ),
              PostRatingWidget(
                  context, reply, post, true, isReply, addReaction),
            ],
          ),
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: NewUserWidget(isReply ? reply.user : post.user)),
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
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "/profile");
            },
            child: NewUserWidget(UserState().user),
          )
        ],
      ),
    );
  }
}

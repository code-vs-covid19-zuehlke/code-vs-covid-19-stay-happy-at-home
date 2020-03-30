import 'package:flutter/material.dart';
import 'package:happyathome/apis/Backend.dart';
import 'package:happyathome/models/Post.dart';
import 'package:happyathome/widgets/BottomBarWidget.dart';
import 'package:happyathome/widgets/CustomColors.dart';
import 'package:happyathome/widgets/NewUserWidget.dart';
import 'package:happyathome/widgets/PostWidget.dart';
import 'package:happyathome/widgets/TimerWidget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../UserState.dart';

class ContentFeed extends StatefulWidget {
  @override
  _ContentFeedState createState() => _ContentFeedState();
}

class _ContentFeedState extends State<ContentFeed> {
  List<Post> posts;
  RefreshController _refreshController =
  RefreshController(initialRefresh: true);

  @override
  void initState() {
    super.initState();
    posts = List();
  }

  void loadPosts() async {
    List<Post> posts = await Backend.getPosts();
    setState(() {
      this.posts = posts;
    });
  }

  void postSelected(post) {
    Navigator.pushNamed(context, "/detail", arguments: post);
  }

  void onRefresh() async {
    await loadPosts();
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.BackgroundColor,
      body: SafeArea(
        child: SmartRefresher(
          enablePullDown: true,
          header: WaterDropMaterialHeader(),
          controller: _refreshController,
          onRefresh: onRefresh,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Expanded(
                flex: 1,
                child: Card(
                  margin: const EdgeInsets.all(16),
                  elevation: 2,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView.builder(
                      itemCount: posts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return PostWidget(posts[index], postSelected);
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: ContentFeedBottomBar(
          _refreshController.requestRefresh),
    );
  }
}

class ContentFeedBottomBar extends StatelessWidget {
  final Function onRaisedButtonNavigationPop;

  const ContentFeedBottomBar(this.onRaisedButtonNavigationPop, {
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
            onPressed: () async {
              await Navigator.pushNamed(context, "/create");
              this.onRaisedButtonNavigationPop();
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            color: Colors.black,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "/profile");
            },
            child: NewUserWidget(UserState().user, 60),
          )
        ],
      ),
    );
  }
}

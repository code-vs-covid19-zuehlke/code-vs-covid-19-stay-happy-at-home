import 'package:flutter/material.dart';
import 'package:happyathome/widgets/BottomBarWidget.dart';
import 'package:happyathome/widgets/CustomColors.dart';
import 'package:happyathome/widgets/PostWidget.dart';

class ContentFeed extends StatefulWidget {
  @override
  _ContentFeedState createState() => _ContentFeedState();
}

class _ContentFeedState extends State<ContentFeed> {
  @override
  void initState() {
    super.initState();
    loadPosts();
  }

  void loadPosts() async {
    //TODO: Load posts and use them in the listview
    //List<Post> posts = await Backend.getPosts();
  }

  void postSelected(id) {
    Navigator.pushNamed(context, "/detail");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.BackgroundColor,
      body: SafeArea(
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
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return PostWidget("Toilet paper tower wanted!",
                          "Where to store all the rolls?", null, postSelected);
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
      bottomNavigationBar: ContentFeedBottomBar(),
    );
  }
}

class ContentFeedBottomBar extends StatelessWidget {
  const ContentFeedBottomBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomBarWidget(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "00:24:30",
                style: TextStyle(
                  fontFamily: "Comfortaa",
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/create");
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
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/profile_picture.jpg"),
            ),
          )
        ],
      ),
    );
  }
}

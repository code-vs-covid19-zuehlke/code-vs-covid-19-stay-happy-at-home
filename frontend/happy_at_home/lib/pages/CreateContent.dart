import 'dart:io';

import 'package:flutter/material.dart';
import 'package:happyathome/models/TargetFeeling.dart';
import 'package:happyathome/widgets/CustomColors.dart';
import 'package:happyathome/widgets/ImagePickerWidget.dart';
import 'package:happyathome/widgets/StyledSlider.dart';
import 'package:happyathome/widgets/TargetFeelingChooserWidget.dart';
import 'package:happyathome/widgets/TitleCard.dart';

class CreateContent extends StatefulWidget {
  @override
  _CreateContentState createState() => _CreateContentState();
}

class _CreateContentState extends State<CreateContent> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final linkController = TextEditingController();
  File _image;
  List<TargetFeeling> chosenFeelings;
  double timePeriod;

  void onChooseImage(image) {
    setState(() {
      _image = image;
    });
  }

  void updateFeelings(feelingList) {
    chosenFeelings = feelingList;
  }

  void updateTimePeriod(time) {
    this.timePeriod = time;
  }

  void postPost() {
    //Todo: Post the post to the backend
    Navigator.pop(context);
  }

  void updateTargetFeelings(targetFeelings) {
    chosenFeelings = targetFeelings;
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    titleController.dispose();
    descriptionController.dispose();
    linkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.BackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(width: 16),
                  Icon(Icons.chevron_left),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Create Post",
                    style: TextStyle(fontFamily: "Comfortaa", fontSize: 35),
                  ),
                ],
              ),
              Card(
                margin: const EdgeInsets.all(16),
                elevation: 2,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Title",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        controller: titleController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter Title / Question / Challenge'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Description",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        controller: descriptionController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Description'),
                      )
                    ],
                  ),
                ),
              ),
              ImagePickerWidget(context, _image, onChooseImage),
              TitleCard(
                title: "Add Link",
                child: TextField(
                  controller: linkController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Link'),
                ),
              ),
              TitleCard(
                  title: "This makes me feel...",
                  child: TargetFeelingChooserWidget(updateTargetFeelings)
              ),
              TitleCard(
                title: "How much time does it need?",
                child: StyledSlider(0, updateTimePeriod),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(15),
                  ),
                  onPressed: postPost,
                  color: Colors.black,
                  child: Text(
                    "POST!",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

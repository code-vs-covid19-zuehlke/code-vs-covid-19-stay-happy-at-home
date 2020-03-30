import 'dart:io';

import 'package:flutter/material.dart';
import 'package:happyathome/models/Emotion.dart';
import 'package:happyathome/usecases/PostCreation.dart';
import 'package:happyathome/widgets/ButtonWidget.dart';
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
  List<Emotion> chosenFeelings;
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

  void postPost() async {
    await PostCreation.create(
        titleController.text,
        descriptionController.text,
        linkController.text,
        _image,
        chosenFeelings.toSet(),
        timePeriod == null ? 0 : timePeriod.round());
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
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.chevron_left)),
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
              TitleCard(
                  title: _image == null ? "Upload Picture" : "Your Picture",
                  child: ImagePickerWidget(context, _image, onChooseImage)),
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
                  child: TargetFeelingChooserWidget(updateTargetFeelings)),
              TitleCard(
                title: "How much time does it need?",
                child: StyledSlider(0, updateTimePeriod),
              ),
              ButtonWidget(
                title: "POST!",
                onPress: postPost,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

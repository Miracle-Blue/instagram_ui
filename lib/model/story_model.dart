import 'package:flutter/material.dart';
import 'package:instagram_ui/model/theme_model.dart';
import 'package:instagram_ui/model/user_model.dart';
import 'package:instagram_ui/model/user_story_model.dart';

class StoryModel extends StatefulWidget {
  final UserStory userStory;

  const StoryModel({Key? key, required this.userStory}) : super(key: key);

  @override
  _StoryModelState createState() => _StoryModelState();
}

class _StoryModelState extends State<StoryModel> {
  @override
  Widget build(BuildContext context) {
    currentTheme.addListener(() => setState(() {}));
    return GestureDetector(
      onTap: () {
        print("tapped");
      },
      child: Container(
        height: 100,
        width: 60,
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 60,
              width: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.grey
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Container(
                height: 54,
                width: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Image.asset(widget.userStory.storyImage),
              ),
            ),
            const SizedBox(height: 7),
            Text(
              widget.userStory.storyName,
              style: const TextStyle(fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}

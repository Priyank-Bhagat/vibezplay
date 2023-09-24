import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vibezplay/view/screens/addvideo/add_caption_screen.dart';

class AddVideoScreen extends StatelessWidget {
  const AddVideoScreen({Key? key}) : super(key: key);

  videoPicker(ImageSource src) async {
    final video = await ImagePicker().pickVideo(source: src);
    if (video != null) {
      Get.to(
          AddCaptionScreen(videoFile: File(video.path), videoPath: video.path));
    } else {
      Get.snackbar("Error Occurred",
          "Error Occurred while Selecting video. Please try again");
    }
  }

  showDialogBoxOpt() {
    return Get.defaultDialog(
      title: "Select Video From",
      titleStyle: const TextStyle(
        fontSize: 24,
      ),
      titlePadding: EdgeInsets.only(top: Get.height * 0.03),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: EdgeInsets.only(
                bottom: Get.height * 0.015, top: Get.height * 0.03),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
            ),
            width: Get.width * 0.4,
            height: Get.height * 0.05,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
              ),
              onPressed: () {
                videoPicker(ImageSource.gallery);
              },
              child: const Text(
                'Gallery',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: Get.height * 0.015),
            decoration: BoxDecoration(border: Border.all(color: Colors.white)),
            width: Get.width * 0.4,
            height: Get.height * 0.05,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
              ),
              onPressed: () {
                videoPicker(ImageSource.camera);
              },
              child: const Text(
                'Camera',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: Get.height * 0.015),
            decoration: BoxDecoration(border: Border.all(color: Colors.white)),
            width: Get.width * 0.4,
            height: Get.height * 0.05,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
              ),
              onPressed: () {
                Get.back();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      height: Get.height * 0.08,
      width: Get.width * 0.6,
      child: ElevatedButton(
        onPressed: () {
          showDialogBoxOpt();
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.black12),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: const BorderSide(color: Colors.white))),
        ),
        child: const Text(
          'Add Video',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

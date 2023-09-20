import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddVideoScreen extends StatelessWidget {
  const AddVideoScreen({Key? key}) : super(key: key);

  videoPicker(ImageSource src) async {
    final video = await ImagePicker().pickVideo(source: src);
    if (video != null) {
      Get.snackbar("Video Selected", video.path);
    } else {
      Get.snackbar("Error Occurred",
          "Error Occurred while Selecting video. Please try again");
    }
  }

  showDialogBoxOpt() {
    return Get.defaultDialog(
        title: "Select Video From",
        content: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 100,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
                onPressed: () {
                  videoPicker(ImageSource.gallery);
                },
                child: const Text('Gallery'),
              ),
            ),
            Container(
              width: 100,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
                onPressed: () {
                  videoPicker(ImageSource.camera);
                },
                child: const Text('Camera'),
              ),
            ),
            Container(
              width: 100,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
                onPressed: () {
                  Get.back();
                },
                child: const Text('Cancel'),
              ),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            showDialogBoxOpt();
          },
          child: Text('Add Video'),
        ),
      ),
    );
  }
}

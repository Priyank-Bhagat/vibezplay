import 'dart:io';
import 'package:get/get.dart';
import 'package:vibezplay/controller/upload_video_controller.dart';
import 'package:vibezplay/view/widgets/text_input.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class AddCaptionScreen extends StatefulWidget {
  AddCaptionScreen({Key? key, required this.videoFile, required this.videoPath})
      : super(key: key);

  File videoFile;
  String videoPath;

  @override
  State<AddCaptionScreen> createState() => _AddCaptionScreenState();
}

class _AddCaptionScreenState extends State<AddCaptionScreen> {
  late VideoPlayerController videoPlayerController;

  TextEditingController _songNameController = TextEditingController();
  TextEditingController _captionController = TextEditingController();
  UploadVideoController uploadVideoController = Get.put(UploadVideoController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      videoPlayerController = VideoPlayerController.file(widget.videoFile);
      videoPlayerController.initialize();
      videoPlayerController.play();
      videoPlayerController.setLooping(true);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size device = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: device.height * 0.7,
              child: VideoPlayer(videoPlayerController),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: device.width,
              child: Column(
                children: [
                  TextInput(
                      myController: _songNameController,
                      myIcon: Icons.music_note_rounded,
                      mylableText: "Song Name"),
                  SizedBox(
                    height: 10,
                  ),
                  TextInput(
                      myController: _captionController,
                      myIcon: Icons.closed_caption,
                      mylableText: "Caption"),
                  SizedBox(
                    height: 20,
                  ),
            Container(
              width: 100,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all(Colors.grey.shade500),
                ),
                onPressed: () {

                  uploadVideoController.uploadVideo(_songNameController.text, _captionController.text, widget.videoPath);
                },
                child: const Text('Upload'),
              ),
            ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

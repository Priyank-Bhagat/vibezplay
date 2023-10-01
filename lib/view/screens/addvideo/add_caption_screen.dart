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

  final TextEditingController _songNameController = TextEditingController();
  final TextEditingController _captionController = TextEditingController();
  UploadVideoController uploadVideoController =
      Get.put(UploadVideoController());

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

  Widget uploadContent = const Text(
    'Upload',
    style: TextStyle(
      fontSize: 18,
    ),
  );

  uploadVid() {
    uploadContent = const Text(
      'Uploading ..',
      style: TextStyle(
        fontSize: 18,
      ),
    );
    setState(() {});
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
              margin: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 10, top: 25),
              width: device.width,
              child: Column(
                children: [
                  TextInput(
                      myController: _songNameController,
                      myIcon: Icons.music_note_rounded,
                      mylableText: "Song Name"),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  TextInput(
                      myController: _captionController,
                      myIcon: Icons.closed_caption,
                      mylableText: "Caption"),
                  SizedBox(
                    height: Get.height * 0.04,
                  ),
                  SizedBox(
                    height: Get.height * 0.06,
                    width: Get.width * 0.4,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.red.shade500),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                      onPressed: () {
                        uploadVid();
                        uploadVideoController.uploadVideo(
                            _songNameController.text,
                            _captionController.text,
                            widget.videoPath);
                      },
                      child: uploadContent,
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

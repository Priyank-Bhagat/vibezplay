import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VibezplayPlayer extends StatefulWidget {
  VibezplayPlayer({Key? key, required this.videoUrl}) : super(key: key);

  String videoUrl;
  @override
  State<VibezplayPlayer> createState() => _VibezplayPlayerState();
}

class _VibezplayPlayerState extends State<VibezplayPlayer> {
  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
          ..initialize().then((value) {});
    videoPlayerController.play();
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
    return Container(
      height: device.height,
      width: device.width,
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: VideoPlayer(videoPlayerController),
    );
  }
}

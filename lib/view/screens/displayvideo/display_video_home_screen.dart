import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vibezplay/controller/video_play_controller.dart';
import 'package:vibezplay/view/screens/comments/comments_screen.dart';
import 'package:vibezplay/view/widgets/profile_button.dart';
import 'package:vibezplay/view/widgets/vibezplay_player.dart';

class DisplayVideoHomeScreen extends StatelessWidget {
  DisplayVideoHomeScreen({Key? key}) : super(key: key);

  final VideoPlayController videoPlayController =
      Get.put(VideoPlayController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return PageView.builder(
          controller: PageController(initialPage: 0, viewportFraction: 1),
          scrollDirection: Axis.vertical,
          itemCount: videoPlayController.videoList.length,
          itemBuilder: (context, index) {
            final data = videoPlayController.videoList[index];
            return Stack(
              children: [
                VibezplayPlayer(videoUrl: data.videoUrl),
                Container(
                  margin: const EdgeInsets.only(bottom: 10, left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        data.username,
                        style: const TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 25),
                      ),
                      SizedBox(
                        height: Get.height * 0.015,
                      ),
                      Text(
                        data.caption,
                        style: const TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: Get.height * 0.008,
                      ),
                      Text(
                        " 🎶 ${data.songName}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      SizedBox(
                        height: Get.height * 0.009,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height - 200,
                    margin: const EdgeInsets.only(
                      right:
                          20, /*top: MediaQuery.of(context).size.height / 2,*/
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ProfileButton(profilePicUrl: data.profilePic),
                        SizedBox(
                          height: Get.height * 0.027,
                        ),
                        InkWell(
                          onTap: () {
                            videoPlayController.likedVideo(data.videoID);
                          },
                          child: Column(
                            children: [
                              const Icon(
                                Icons.favorite_rounded,
                                size: 39,
                                color: Colors.pinkAccent,
                              ),
                              Text(
                                data.likes.length.toString(),
                                style: const TextStyle(
                                    fontSize: 15, color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.027,
                        ),
                        Column(
                          children: [
                            const Icon(
                              Icons.reply,
                              size: 35,
                              color: Colors.white,
                            ),
                            Text(
                              data.shareCount.toString(),
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.white),
                            )
                          ],
                        ),
                        SizedBox(
                          height: Get.height * 0.027,
                        ),
                        GestureDetector(
                          onTap: (){
                            Get.to( CommentsScreen(id: data.videoID,));
                          },
                          child: Column(
                            children: [
                              const Icon(
                                Icons.comment,
                                size: 35,
                                color: Colors.white,
                              ),
                              Text(
                                data.commentsCount.toString(),
                                style: const TextStyle(
                                    fontSize: 15, color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        );
      }),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:vibezplay/controller/video_play_controller.dart';
import 'package:vibezplay/view/screens/comments/comments_screen.dart';
import 'package:vibezplay/view/screens/profilepage/profile_screen.dart';
import 'package:vibezplay/view/widgets/heart_animation.dart';
import 'package:vibezplay/view/widgets/profile_button.dart';
import 'package:vibezplay/view/widgets/vibezplay_player.dart';

class DisplayVideoHomeScreen extends StatefulWidget {
  DisplayVideoHomeScreen({Key? key}) : super(key: key);

  @override
  State<DisplayVideoHomeScreen> createState() => _DisplayVideoHomeScreenState();
}

class _DisplayVideoHomeScreenState extends State<DisplayVideoHomeScreen> {
  bool isHeartAnimating = false;
  bool isLiked = false;

  final VideoPlayController videoPlayController =
      Get.put(VideoPlayController());

  Future<void> share() async {
    await FlutterShare.share(
      title: 'Download My Personal Short Video App',
      text: 'Watch and upload joyful and good videos on this platform',
    );
  }

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
            return InkWell(
              onDoubleTap: () {
                isHeartAnimating = true;
                videoPlayController.likedVideo(data.videoID);
              },
              child: Stack(
                children: [
                  Stack(
                    children: [
                      VibezplayPlayer(videoUrl: data.videoUrl),
                      Opacity(
                        opacity: isHeartAnimating ? 1 : 0,
                        child: HeartAnimation(
                          onEnd: () {
                            setState(() {
                              isHeartAnimating = false;
                            });
                          },
                          duration: const Duration(milliseconds: 400),
                          isAnimating: isHeartAnimating,
                          child: Center(
                            child: Icon(Icons.favorite,
                                color: data.likes.contains(
                                        FirebaseAuth.instance.currentUser!.uid)
                                    ? Colors.red
                                    : Colors.transparent,
                                size: 100),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10, left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '@${data.username}',
                          style: const TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 25),
                        ),
                        SizedBox(
                          height: Get.height * 0.015,
                        ),
                        Text(
                          data.caption,
                          style: const TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: Get.height * 0.008,
                        ),
                        Text(
                          "🎙️ ${data.songName} 🎙️",
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
                          InkWell(
                              onTap: () {
                                Get.to(ProfileScreen(uid: data.uid));
                              },
                              child: ProfileButton(
                                  profilePicUrl: data.profilePic)),
                          SizedBox(
                            height: Get.height * 0.027,
                          ),
                          InkWell(
                            onTap: () {
                              isHeartAnimating = true;
                              isLiked = true;
                              videoPlayController.likedVideo(data.videoID);
                            },
                            child: Column(
                              children: [
                                HeartAnimation(
                                   isAnimating: isLiked,
                                  onEnd: (){
                                     setState(() {
                                       isLiked = false;
                                     });
                                  },
                                  child: Icon(
                                    Icons.favorite_rounded,
                                    size: 39,
                                    color: data.likes.contains(FirebaseAuth
                                            .instance.currentUser!.uid)
                                        ? Colors.red
                                        : Colors.white,
                                  ),
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
                          InkWell(
                            onTap: () {
                              share();
                            },
                            child: const Column(
                              children: [
                                Icon(
                                  Icons.reply,
                                  size: 35,
                                  color: Colors.white,
                                ),
                                Text(
                                  'Share',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.027,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(CommentsScreen(
                                id: data.videoID,
                              ));
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
              ),
            );
          },
        );
      }),
    );
  }
}

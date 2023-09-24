import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vibezplay/view/widgets/profile_button.dart';
import 'package:vibezplay/view/widgets/vibezplay_player.dart';

class DisplayVideoHomeScreen extends StatelessWidget {
  const DisplayVideoHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: PageController(initialPage: 0, viewportFraction: 1),
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              VibezplayPlayer(videoUrl: 'video url here'),
              Container(
                margin: const EdgeInsets.only(bottom: 10, left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      '@username',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
                    ),
                    SizedBox(
                      height: Get.height * 0.015,
                    ),
                    const Text(
                      'My caption is here',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: Get.height * 0.008,
                    ),
                    const Text(
                      ' 🎶 Song name  ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                  height: MediaQuery.of(context).size.height - 250,
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 2, right: 20),
                  child: Column(
                    children: [
                      ProfileButton(profilePicUrl: 'add proile picture here'),
                      SizedBox(
                        height: Get.height * 0.027,
                      ),
                      const Column(
                        children: [
                          Icon(
                            Icons.favorite_rounded,
                            size: 39,
                            color: Colors.red,
                          ),
                          Text(
                            "Like",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          )
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 0.027,
                      ),
                      const Column(
                        children: [
                          Icon(
                            Icons.reply,
                            size: 35,
                            color: Colors.white,
                          ),
                          Text(
                            "Share",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          )
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 0.027,
                      ),
                      const Column(
                        children: [
                          Icon(
                            Icons.comment,
                            size: 35,
                            color: Colors.white,
                          ),
                          Text(
                            "Comment",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

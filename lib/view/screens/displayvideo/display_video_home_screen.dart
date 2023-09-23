import 'package:flutter/material.dart';
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
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('@username', style: TextStyle(fontWeight: FontWeight.w700,fontSize: 25),),
                    Text('My caption is here'),
                    Text('Song name',style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              Positioned(
                right: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height - 250,
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 3.5, right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ProfileButton(profilePicUrl: 'add proile picture here'),
                      Column(
                        children: [
                          Icon(
                            Icons.favorite_rounded,
                            size: 35,
                            color: Colors.white,
                          ),
                          Text(
                            "Like",
                            style:
                            TextStyle(fontSize: 15, color: Colors.white),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.reply,
                            size: 45,
                            color: Colors.white,
                          ),
                          Text(
                            "Share",
                            style:
                            TextStyle(fontSize: 15, color: Colors.white),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.comment,
                            size: 35,
                            color: Colors.white,
                          ),
                          Text(
                            "Comment",
                            style:
                            TextStyle(fontSize: 15, color: Colors.white),
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

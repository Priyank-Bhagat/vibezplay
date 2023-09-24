import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  ProfileButton({Key? key, required this.profilePicUrl}) : super(key: key);
  String profilePicUrl;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 70,
      child: Stack(
        children: [
          Positioned(
              child: Container(
            width: 70,
            height: 70,
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const Image(
                // image: NetworkImage(profilePhotoUrl),
                image: NetworkImage(
                    "https://e1.pxfuel.com/desktop-wallpaper/69/531/desktop-wallpaper-cute-for-phone-unique-android-phone-unique-dp-thumbnail.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ))
        ],
      ),
    );
  }
}

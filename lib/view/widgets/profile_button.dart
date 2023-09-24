import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  ProfileButton({Key? key, required this.profilePicUrl}) : super(key: key);
  String profilePicUrl;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Stack(
        children: [
          Positioned(
              child: Container(
            width: 60,
            height: 60,
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child:  Image(
                 image: NetworkImage(profilePicUrl),
                fit: BoxFit.cover,
              ),
            ),
          ))
        ],
      ),
    );
  }
}

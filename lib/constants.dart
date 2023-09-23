import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vibezplay/view/screens/addvideo/add_video_screen.dart';
import 'package:vibezplay/view/screens/displayvideo/display_video_home_screen.dart';

//Constant for Glitch_Effect
getRandomColor() => [
      Colors.blueAccent,
      Colors.redAccent,
      Colors.greenAccent,
    ][Random().nextInt(3)];

// Project Colors constants
const kBackgroundColor = Colors.black;
var kButtonColor = Colors.red[400];
const kBorderColor = Colors.grey;


const pageIndex=[
  DisplayVideoHomeScreen(),
  Text('Search'),
  AddVideoScreen(),
  Text('Message'),
  Text('Profile')
];

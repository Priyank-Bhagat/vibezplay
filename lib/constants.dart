import 'dart:math';

import 'package:flutter/material.dart';

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
  'Home',
  'Search',
  'Add',
  'Message',
  'Profile'
];

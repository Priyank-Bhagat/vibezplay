import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class VideoModel{
  String username;
  String uid;
  String videoID;
  List likes;
  int commentsCount;
  int shareCount;
  String songName;
  String caption;
  String videoUrl;
  String thumbnail;
  String profilePic;

  VideoModel({
    required this.username,
    required this.uid,
    required this.thumbnail,
    required this.caption,
    required this.commentsCount,
    required this.videoID,
    required this.likes,
    required this.profilePic,
    required this.shareCount,
    required this.songName,
    required this.videoUrl
  });

  Map<String, dynamic> toJson()=>{
    "username" : username,
    "uid" : uid,
    "profilePic" : profilePic,
    "videoID" : videoID,
    "likes" : likes,
    "commentsCount" : commentsCount,
    "shareCount" : shareCount,
    "songName" : songName,
    "caption" : caption,
    "videoUrl" : videoUrl,
    "thumbnail" : thumbnail

  };

  static VideoModel fromSnap(DocumentSnapshot snap){
    var sst = snap.data() as Map<String,dynamic>;

    return VideoModel(
        username: sst["username"],
        uid: sst["uid"],
        videoID: sst["videoID"],
        likes: sst["likes"],
        commentsCount:  sst['commentsCount'],
        caption:  sst["caption"],
        shareCount: sst["shareCount"],
        songName: sst["songName"],
        thumbnail: sst["thumbnail"],
        profilePic: sst["profilePic"],
        videoUrl: sst["videoUrl"]
    );
  }

}
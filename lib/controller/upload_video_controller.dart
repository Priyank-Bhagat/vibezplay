import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:vibezplay/model/video_model.dart';
import 'package:video_compress/video_compress.dart';

class UploadVideoController extends GetxController {

  static UploadVideoController instance = Get.find();



  var uuid = const Uuid();

  // this function is main here we run all other functions
  uploadVideo(String songName, String caption, String videoPath) async {

    try{
      String uid = FirebaseAuth.instance.currentUser!.uid;

      DocumentSnapshot userDoc =
      await FirebaseFirestore.instance.collection("users").doc(uid).get();

      String videoID = uuid.v1();

      String videoUrl = await _uploadVideoToStorage(videoID, videoPath);

      String thumbnail = await _uploadVideoThumbtoStorage(videoID, videoPath);

      VideoModel videoModel =  VideoModel(username:  (userDoc.data()! as Map<String , dynamic>)['name'], uid: uid, thumbnail: thumbnail, caption: caption, commentsCount: 0, videoID: videoID, likes: [], profilePic: (userDoc.data()! as Map<String , dynamic>)['profilePic'], shareCount: 0, songName: songName, videoUrl: videoUrl);

      await FirebaseFirestore.instance.collection("videos").doc(videoID).set(videoModel.toJson());
      Get.snackbar("Video Uploaded Successfully", "Thank You Sharing Your Content");
      Get.back();
    }catch (e){
      print(e);
      rethrow;
    }

  }

  // below function used to Compress and upload video to firestorage
  Future<String> _uploadVideoToStorage(String videoId, String videoPath) async {
    Reference reference =
        FirebaseStorage.instance.ref().child("videos").child(videoId);
    UploadTask uploadTask = reference.putFile(await _compressVideo(videoPath));
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  _compressVideo(String videoPath) async {
    final compressedVideo = await VideoCompress.compressVideo(videoPath,
        quality: VideoQuality.MediumQuality);
    return compressedVideo!.file;
  }

  //below functions used for Generate Thumbnail and upload on firestorage
  Future<File> _generateThumbnail(String videoPath) async {
    final thumbnail = await VideoCompress.getFileThumbnail(videoPath);
    return thumbnail;
  }

  Future<String> _uploadVideoThumbtoStorage(String id, String videoPath) async {
    Reference reference =
        FirebaseStorage.instance.ref().child("thumbnail").child(id);
    UploadTask uploadTask =
        reference.putFile(await _generateThumbnail(videoPath));
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}

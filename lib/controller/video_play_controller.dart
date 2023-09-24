import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:vibezplay/model/video_model.dart';

import 'auth_controller.dart';

class VideoPlayController extends GetxController {
  final Rx<List<VideoModel>> _videoList = Rx<List<VideoModel>>([]);

  List<VideoModel> get videoList => _videoList.value;

  @override
  void onInit() {
    super.onInit();

    _videoList.bindStream(
      FirebaseFirestore.instance.collection("videos").snapshots().map(
        (QuerySnapshot query) {
          List<VideoModel> retVal = [];
          for (var element in query.docs) {
            retVal.add(VideoModel.fromSnap(element));
          }
          return retVal;
        },
      ),
    );
  }


  likedVideo(String videoID) async {
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection("videos")
        .doc(videoID)
        .get();
    var uid = AuthController.instance.user.uid;
    if ((doc.data() as dynamic)['likes'].contains(uid)) {
      await FirebaseFirestore.instance
          .collection("videos")
          .doc(videoID)
          .update({
        'likes': FieldValue.arrayRemove([uid]),
      });
    } else {
            await FirebaseFirestore.instance.collection("videos").doc(videoID).update(
        {
          'likes': FieldValue.arrayUnion([uid]),
        },
      );
    }
  }
}

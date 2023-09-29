import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:get/get.dart';
import 'package:vibezplay/model/user_model.dart';

class SearchUserController extends GetxController {
  final Rx<List<UserModel>> _searchUsers = Rx<List<UserModel>>([]);

  List<UserModel> get searchedUsers => _searchUsers.value;

  searchUser(String query) async {
    _searchUsers.bindStream(
      FirebaseFirestore.instance
          .collection("users")
          .where("name", isGreaterThanOrEqualTo: query)
          .snapshots()
          .map(
        (QuerySnapshot queryRes) {
          List<UserModel> retVal = [];
          for (var element in queryRes.docs) {
            retVal.add(UserModel.fromSnap(element));
          }
          return retVal;
        },
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String name;
  String profilePhoto;
  String email;
  String uid;

  UserModel(
      {required this.name,
      required this.profilePhoto,
      required this.email,
      required this.uid});

// Send data from App to Firebase. Firebase accept Map Data. Map is Same like Json
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "profilePic": profilePhoto,
      "email": email,
      "uid": uid,
    };
  }

// will used to convert Firebase response to this model.
  static UserModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return UserModel(
        name: snapshot['name'],
        profilePhoto: snapshot['profilePic'],
        email: snapshot['email'],
        uid: snapshot['uid']);
  }
}

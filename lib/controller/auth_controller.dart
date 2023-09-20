import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vibezplay/model/user_model.dart';
import 'package:vibezplay/view/screens/auth/login_screen.dart';
import 'package:vibezplay/view/screens/home_screen.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();


 // this method is used to keep user loggedin
  late Rx<User?> _user;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    _user = Rx<User?>(FirebaseAuth.instance.currentUser);
    _user.bindStream(FirebaseAuth.instance.authStateChanges());
    ever(_user, (User? user) {
      if (user == null) {
        Get.offAll(() => LoginScreen());
      } else {
        Get.offAll(() => HomeScreen());
      }
    });
  }

  // this method is used to pick image from device gallery
  File? proImg;
  pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    }
    final img = File(image.path);
    proImg = img;
  }

  // this method is used to uploadProfile pic to FireStorage
  Future<String> _uploadpropic(File image) async {
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('profilePic')
        .child(FirebaseAuth.instance.currentUser!.uid);

    TaskSnapshot snapshot = await ref.putFile(image);

    String imageDownloadUrl = await snapshot.ref.getDownloadURL();
    return imageDownloadUrl;
  }

  // this method is used when you need to register new user
  void signUp(
      String userName, String email, String password, File? image) async {
    try {
      if (userName.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        UserCredential credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        String downloadUrl = await _uploadpropic(image);

        UserModel userModel = UserModel(
            name: userName,
            profilePhoto: downloadUrl,
            email: email,
            uid: credential.user!.uid);
        await FirebaseFirestore.instance
            .collection('users')
            .doc(credential.user!.uid)
            .set(userModel.toJson());
      } else {
        Get.snackbar(
            'Error Creating Account', "Please add all required fields");
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
        Get.snackbar("Error Occurred", e.toString());
      }
    }
  }

  // this method is used to login
  void login(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
      } else {
        Get.snackbar('Something is missing',
            "Make sure to fill all the required fields");
      }
    } catch (e) {
      rethrow;
    }
  }
}

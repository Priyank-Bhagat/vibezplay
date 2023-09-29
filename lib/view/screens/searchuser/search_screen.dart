import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vibezplay/constants.dart';
import 'package:vibezplay/controller/search_user_controller.dart';

import '../../../model/user_model.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  TextEditingController searchQuery = TextEditingController();
  final SearchUserController searchController = Get.put(SearchUserController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: kBackgroundColor,
          title: TextFormField(
            decoration:  InputDecoration(
              suffixIcon: GestureDetector(
                  onTap: (){
                    searchController.searchUser(searchQuery.text);
                  },
                  child: const Icon(Icons.person_search_rounded)),
                suffixIconColor: Colors.white,
                fillColor: kBackgroundColor,
                filled: true,
                border: InputBorder.none,
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)
                ),
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white54)
                ),
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding:
                    const EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                hintText: "Search Username"),
            controller: searchQuery,
            onFieldSubmitted: (value) {
              searchController.searchUser(value);
            },
          ),
        ),
        body: searchController.searchedUsers.isEmpty
            ? const Center(
                child: Text("Search Users!"),
              )
            : ListView.builder(
                itemCount: searchController.searchedUsers.length,
                itemBuilder: (context, index) {
                  UserModel user = searchController.searchedUsers[index];

                  return ListTile(
                    onTap: () {},
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(user.profilePhoto),
                    ),
                    title: Text(user.name),
                  );
                }),
      );
    });
  }
}

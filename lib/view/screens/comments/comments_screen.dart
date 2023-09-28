import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vibezplay/view/widgets/text_input.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../controller/comment_controller.dart';

class CommentsScreen extends StatelessWidget {
  final String id;
  CommentsScreen({Key? key, required this.id}) : super(key: key);

  final TextEditingController _commentTextEditingController =
      TextEditingController();

  CommentController commentController = Get.put(CommentController());

  @override
  Widget build(BuildContext context) {
    commentController.updatePostID(id);
    Size device = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: device.height,
          width: device.width,
          child: Column(
            children: [
              Expanded(
                child: Obx(() {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: commentController.comments.length,
                      itemBuilder: (context, index) {
                        final comment = commentController.comments[index];
                        return Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(comment.profilePic),
                              // backgroundColor: Colors.blueGrey,
                            ),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    height: 20,
                                    child: Text(
                                      comment.username,
                                      maxLines: 2,
                                      overflow: TextOverflow.fade,
                                      style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.redAccent),
                                    )),
                                Text(comment.comment),
                                const SizedBox(
                                  height: 5,
                                )
                              ],
                            ),
                            subtitle: Text(
                              timeago.format(comment.datePub.toDate()),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            trailing: Column(
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      commentController.likeComment(comment.id);
                                    },
                                    child: Icon(Icons.favorite,
                                        color: comment.likes.contains(
                                                FirebaseAuth
                                                    .instance.currentUser!.uid)
                                            ? Colors.red
                                            : Colors.white)),
                                const SizedBox(
                                  height: 12,
                                ),
                                Text('${comment.likes.length} Like'),
                              ],
                            ),
                          ),
                        );
                      });
                }),
              ),
              const Divider(),
              ListTile(
                title: TextInput(
                    myController: _commentTextEditingController,
                    myIcon: Icons.comment,
                    mylableText: "Comment"),
                trailing: TextButton(
                  onPressed: () {
                    commentController
                        .postComment(_commentTextEditingController.text);
                  },
                  child: const Text('Send'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

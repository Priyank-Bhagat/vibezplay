import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vibezplay/view/widgets/text_input.dart';

import '../../../controller/comment_controller.dart';

class CommentsScreen extends StatelessWidget {
  final String id;
   CommentsScreen({Key? key, required this.id}) : super(key: key);

  final TextEditingController _commentTextEditingController  = TextEditingController();

  CommentController commentController = Get.put(CommentController());

  @override
  Widget build(BuildContext context) {
    commentController.updatePostID(id);
    Size device = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: device.height ,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (context, index){
                      return ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Colors.blueGrey,
                      ),
                        title: Row(
                          children: [
                            SizedBox(width: device.width* 0.21,
                                child: Text('UserName', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.redAccent),)),
                            Text('Comment'),
                          ],
                        ),
                        subtitle: Row(
                          children: [
                            SizedBox(
                                width:device.width* 0.25,
                                child: Text('2 minutes ago', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),)),
                            Text('10 Likes'),
                          ],
                        ),
                        trailing: Icon(Icons.favorite),
                      );
                    }),
              ),
              const Divider(),
              ListTile(
                title: TextInput(myController: _commentTextEditingController, myIcon: Icons.comment, mylableText: "Send"),
                trailing: TextButton(onPressed: (){
                  commentController.postComment(_commentTextEditingController.text);

                }, child: const Text('Send'),),
              )
            ],
          ),
        ),
      ),
    );
  }
}

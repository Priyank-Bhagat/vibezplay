import 'package:flutter/material.dart';
import 'package:vibezplay/view/widgets/text_input.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size device = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: device.height,
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
                            SizedBox(width: device.width* 0.25,
                                child: Text('UserName', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.redAccent),)),
                            Text('Comment'),
                          ],
                        ),
                        subtitle: Row(
                          children: [
                            SizedBox(
                                width:device.width* 0.3,
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
                title: TextInput(myController: TextEditingController(), myIcon: Icons.comment, mylableText: "Send"),
                trailing: TextButton(onPressed: (){}, child: const Text('Send')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
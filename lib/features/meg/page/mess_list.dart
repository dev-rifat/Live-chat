import 'package:flutter/cupertino.dart' show StatelessWidget;
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:web_socket/features/meg/page/inbox.dart' show InboxScreen;

class MessListScreen extends StatelessWidget {
  const MessListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Messages list"), centerTitle: false),
      body: ListView.builder(
        itemCount: 6,

        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Get.to(() => InboxScreen());
            },
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZSUyMHBpY3xlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",
              ),
            ),
            title: Text("User $index"),
            subtitle: Text("Message $index"),
          );
        },
      ),
    );
  }
}

import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_fbchat/model/user.dart';
import 'package:flutter_fbchat/page/chat_page.dart';

class ChatBodyWidget extends StatelessWidget {
  final List<User> users;

  const ChatBodyWidget({@required this.users, Key key}) : super(key: key);
  Widget buildChats() => ListView.builder(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final user = users[index];

          return Container(
            height: 75,
            child: ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ChatPage(user: user),
                ));
              },
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(user.urlAvatar),
              ),
              title: Text(user.name),
            ),
          );
        },
        itemCount: users.length,
      );
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: buildChats(),
      ),
    );
  }
}

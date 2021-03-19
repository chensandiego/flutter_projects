import 'package:flutter/material.dart';
import 'package:flutter_fbchat/api/firebase_api.dart';
import 'package:flutter_fbchat/model/user.dart';
import '../widget/ChatHeaderWidget.dart';
import '../widget/ChatBodyWidget.dart';

class ChatsPage extends StatelessWidget {
  Widget buildText(String text) => Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: StreamBuilder<List<User>>(
            stream: FirebaseApi.getUsers(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());

                default:
                  if (snapshot.hasError) {
                    print(snapshot.error);
                    return buildText("Something went wrong try later");
                  } else {
                    final users = snapshot.data;
                    if (users.isEmpty) {
                      return buildText('no users found');
                    } else {
                      return Column(
                        children: [
                          ChatHeaderWidget(users: users),
                          ChatBodyWidget(users: users),
                        ],
                      );
                    }
                  }
              }
            }),
      ),
    );
  }
}

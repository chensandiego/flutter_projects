import 'package:flutter/material.dart';
import '../model/user.dart';
import '../widget/profile_header_widget.dart';
import '../widget/new_message_widget.dart';
import '../widget/messages_widget.dart';

class ChatPage extends StatefulWidget {
  final User user;

  ChatPage({@required this.user, Key key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.blue,
      body: SafeArea(
          child: Column(
        children: [
          ProfileHeaderWidget(name: widget.user.name),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: MessagesWidget(idUser: widget.user.idUser),
            ),
          ),
          NewMessageWidget(idUser: widget.user.idUser),
        ],
      )),
    );
  }
}

import 'package:flutter/material.dart';

class User {
  final int index;
  final String name;

  User(this.index, this.name);
}

class ChatUsers {
  String name;
  String messageText;
  String time;
  ChatUsers({
    @required this.name,
    @required this.messageText,
    @required this.time,
  });
}

class ChatMessage {
  String messageContent;
  String messageType;
  ChatMessage({
    this.messageContent,
    this.messageType,
  });
}

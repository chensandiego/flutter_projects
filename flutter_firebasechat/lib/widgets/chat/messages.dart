import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebasechat/widgets/chat/message_bubble.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future getUser() async {
  final user = await FirebaseAuth.instance.currentUser;

  return user;
}

class Messages extends StatelessWidget {
  const Messages({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getUser(),
        builder: (ctx, futureSnapshot) {
          if (futureSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('chat')
                  .orderBy(
                    'createdAt',
                    descending: true,
                  )
                  .snapshots(),
              builder: (ctx, chatSnapshot) {
                if (chatSnapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final ChatDocs = chatSnapshot.data.docs;
                return ListView.builder(
                  reverse: true,
                  itemCount: ChatDocs.length,
                  itemBuilder: (ctx, index) => MessageBubble(
                    ChatDocs[index]['text'],
                    ChatDocs[index]['username'],
                    ChatDocs[index]['userImage'],
                    ChatDocs[index]['userId'] == futureSnapshot.data.uid,
                    key: ValueKey(ChatDocs[index].id),
                  ),
                );
              });
        });
  }
}

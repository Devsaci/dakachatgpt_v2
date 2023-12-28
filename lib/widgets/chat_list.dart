import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dakachatgpt_v2/providers/authentication_provider.dart';
import 'package:dakachatgpt_v2/providers/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';

class ChatList extends StatefulWidget {
  const ChatList({super.key});

  @override
  State<ChatList> createState() => _ChatListState();
}

// https://firebase.flutter.dev/docs/firestore/usage#realtime-changes
class _ChatListState extends State<ChatList> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();

  @override
  Widget build(BuildContext context) {
    final uid = context.read<AuthenticationProvider>().userModel!.uid;
    return StreamBuilder<QuerySnapshot>(
      stream: context.read<ChatProvider>().getChatStream(uid: uid),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.orangeAccent),
          );
        }

        if (snapshot.data!.docs.isEmpty) {
          return const Center(
              child: Text(
            "Chat is Empty",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 1.5),
          ));
        }

        final messageSnapshot = snapshot.data!.docs;
        return ListView.builder(
          itemCount: messageSnapshot.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(messageSnapshot[index][Constants.message]),
              //subtitle: Text(messageSnapshot[index]['phone']),
            );
          },
        );
      },
    );
  }
}

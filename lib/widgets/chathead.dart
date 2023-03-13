import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_chat_app/model/message.dart';

class ChatHead extends StatefulWidget {
  const ChatHead({super.key});

  @override
  State<ChatHead> createState() => _ChatHeadState();
}

class _ChatHeadState extends State<ChatHead> {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final Stream<QuerySnapshot> _messageStream =
      FirebaseFirestore.instance.collection('messages').snapshots();
  List<Message> _messages = [];

  @override
  void initState() {
    // TODO: implement initState
    List<Message> allMessages = [];

    db.collection("messages").get().then(
      (querySnapshot) {
        print("Successfully completed");
        for (var docSnapshot in querySnapshot.docs) {
          Message mm = Message(
            name: docSnapshot.data()['name'],
            message: docSnapshot.data()['message'],
            picture: docSnapshot.data()['picture'],
          );
          allMessages.add(mm);
          print('${docSnapshot.id} => ${docSnapshot.data()}');
        }

        setState(() {
          _messages = allMessages;
        });
      },
      onError: (e) => print("Error completing: $e"),
    );
  }

  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _messageStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs
              .map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                Message mm = Message(
                    name: data['name'],
                    message: data['message'],
                    picture: data['picture']);
                return ListTile(
                  title: Text(data['name']),
                  subtitle: Text(data['message']),
                );
              })
              .toList()
              .cast(),
        );
      },
    );
  }
}

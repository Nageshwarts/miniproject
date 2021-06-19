import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'registration_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;
User? loggedUser;

class ChatScreen extends StatefulWidget {
  static String ids = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  final messagetextcontroller = TextEditingController();
  String? messagetext;

  void initState() {
    super.initState();
    getcurrentuser();
  }

  void getcurrentuser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedUser = user as User?;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messagetextcontroller,
                      onChanged: (value) {
                        messagetext = value;
                        //Do something with the user input.
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  // ignore: deprecated_member_use
                  FlatButton(
                    onPressed: () {
                      messagetextcontroller.clear();
                      _firestore.collection('messages').add(
                          {'sender': loggedUser!.email, 'text': messagetext});
                    },
                    child: Text(
                      'Send',
                      // style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('messages').snapshots(),
      builder: (context, snapshot) {
        List<messagebubble> messageBubbles = [];
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.blueAccent,
            ),
          );
        }
        final messages = snapshot.data!.docs.reversed;

        for (var message in messages) {
          final messageSender = message.get('sender');
          final messageText = message.get('text');
          final currentuser = loggedUser!.email;
          if (currentuser == messageSender) {}
          final messageBubble = messagebubble(
            sender: messageSender,
            text: messageText,
            isme: currentuser == messageSender,
          );
          messageBubbles.add(messageBubble);
        }

        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10.00, vertical: 20.00),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}

class messagebubble extends StatelessWidget {
  messagebubble({required this.sender, required this.text, required this.isme});
  late final String text;
  late final String sender;
  final bool isme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isme ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: TextStyle(fontSize: 12.00, color: Colors.black54),
          ),
          Material(
            borderRadius: BorderRadius.only(
                topLeft: isme ? Radius.circular(30.00) : Radius.circular(0.00),
                topRight:
                    isme ? Radius.circular(00.00) : Radius.circular(30.00),
                bottomLeft: Radius.circular(30.00),
                bottomRight: Radius.circular(30.00)),
            elevation: 10.00,
            color: isme ? Colors.blueAccent : Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.00),
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 15.00,
                    color: isme ? Colors.white : Colors.black54),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:chai_pe_charcha/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  static const id = "chatScreen";
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  late User loggerInUser;
  void GetCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggerInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amberAccent,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Hero(
              tag: 'logo',
              child: Image.asset("assets/chai_pe_charcha.png"),
            ),
          ),
          title: const Text(
            "Chai Pe Charcha",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                _auth.signOut();
              },
              icon: const Icon(Icons.logout),
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {},
                    decoration:
                        textFieldinputDecoration.copyWith(labelText: ""),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {},
                  color: Colors.amber,
                  child: const Icon(Icons.send),
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:chai_pe_charcha/buttonMaterial.dart';
import 'package:chai_pe_charcha/chat_screen.dart';
import 'package:chai_pe_charcha/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const id = "loginScreen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  var loginPassword;
  var loginUsername;
  FocusNode nodeone = FocusNode();
  FocusNode nodetwo = FocusNode();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 70,
            ),
            const Text(
              "Welcome Back",
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            SizedBox(
              width: size.width * 0.8,
              child: TextField(
                focusNode: nodeone,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  loginUsername = value;
                },
                onEditingComplete: () {
                  FocusScope.of(context).requestFocus(nodetwo);
                },
                decoration:
                    textFieldinputDecoration.copyWith(labelText: "username"),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: size.width * 0.8,
              child: TextField(
                focusNode: nodetwo,
                obscureText: true,
                onChanged: (value) {
                  loginPassword = value;
                },
                decoration:
                    textFieldinputDecoration.copyWith(labelText: "password"),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ButtonMaterial(
                size: size,
                onpressed: () async {
                  var user = await _auth.signInWithEmailAndPassword(
                      email: loginUsername, password: loginPassword);
                  try {
                    if (user != null) {
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                btnColor: kButtonColor,
                title: "LogIn")
          ],
        ),
      ),
    );
  }
}

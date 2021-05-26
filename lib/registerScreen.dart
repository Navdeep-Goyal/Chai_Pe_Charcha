import 'package:chai_pe_charcha/buttonMaterial.dart';
import 'package:chai_pe_charcha/chat_screen.dart';
import 'package:chai_pe_charcha/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  static const id = "registerScreen";

  @override
  State<RegisterScreen> createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  var username = "";
  var password = "";
  var user;

  FocusNode usernameNode = FocusNode();
  FocusNode passwordNode = FocusNode();

  final _auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: kcommonAppBar,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(35),
                  child: Text(
                    "Welome\nChai Lovers",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: size.width * 0.8,
                child: TextField(
                    focusNode: usernameNode,
                    onEditingComplete: () {
                      FocusScope.of(context).requestFocus(passwordNode);
                    },
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      username = value;
                    },
                    textAlignVertical: TextAlignVertical.center,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    decoration: textFieldinputDecoration.copyWith(
                        labelText: "username")),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: size.width * 0.8,
                child: TextField(
                  focusNode: passwordNode,
                  onChanged: (value) {
                    password = value;
                  },
                  obscureText: true,
                  textAlignVertical: TextAlignVertical.center,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                  decoration: textFieldinputDecoration.copyWith(
                    labelText: "Password",
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ButtonMaterial(
                  size: size,
                  onpressed: () async {
                    try {
                      user = await _auth.createUserWithEmailAndPassword(
                          email: username, password: password);
                    } catch (e) {
                      print(e);
                    }
                    await Navigator.pushNamed(context, ChatScreen.id);
                  },
                  btnColor: Colors.amber,
                  title: "Register")
            ],
          ),
        ),
      ),
    );
  }
}

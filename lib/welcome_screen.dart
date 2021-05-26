import 'package:chai_pe_charcha/buttonMaterial.dart';
import 'package:chai_pe_charcha/constants.dart';
import 'package:chai_pe_charcha/login_screen.dart';
import 'package:chai_pe_charcha/registerScreen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static const id = "weatherscreen";
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: "logo",
              child: Image.asset("assets/chai_pe_charcha.png"),
            ),
            const SizedBox(
              height: 20,
            ),
            ButtonMaterial(
              size: size,
              onpressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
              btnColor: kButtonColor,
              title: "Log In",
            ),
            const SizedBox(
              height: 20,
            ),
            ButtonMaterial(
              size: size,
              onpressed: () {
                Navigator.pushNamed(context, RegisterScreen.id);
              },
              btnColor: kButtonColor,
              title: "register",
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

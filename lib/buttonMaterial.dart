import 'package:flutter/material.dart';

class ButtonMaterial extends StatelessWidget {
  ButtonMaterial({
    required this.size,
    required this.onpressed,
    required this.btnColor,
    required this.title,
  });
  final Function() onpressed;
  final Size size;
  final Color btnColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onpressed,
      minWidth: size.width * 0.8,
      color: btnColor,
      focusColor: btnColor,
      child: Text(
        title,
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }
}

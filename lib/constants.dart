import 'package:flutter/material.dart';

const kButtonColor = Color(0xFFf7a440);
const kmainColor = Color(0xFFe1701a);
const kcreamColor = Color(0xFFf6dcbf);
const kgreyColor = Color(0xFFaaaaaa);

const textFieldinputDecoration = InputDecoration(
  contentPadding: EdgeInsets.only(
    left: 20,
  ),
  floatingLabelBehavior: FloatingLabelBehavior.always,
  border: OutlineInputBorder(
    borderSide:
        BorderSide(color: kButtonColor, width: 1, style: BorderStyle.solid),
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide:
        BorderSide(color: kButtonColor, width: 2, style: BorderStyle.solid),
    borderRadius: BorderRadius.all(
      Radius.circular(50),
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black,
      width: 1,
      style: BorderStyle.solid,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(50),
    ),
  ),
  labelText: "Username",
  labelStyle: TextStyle(
    color: kButtonColor,
  ),
);

var kcommonAppBar = AppBar(
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
);

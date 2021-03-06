import 'package:flutter/material.dart';

// Colos that use in our app
const kSecondaryColor = Color(0xFF82C0BB);
const kTextColor = Color(0xFF12153D);
const kTextLightColor = Color(0xFF9A9BB2);
const kFillStarColor = Color(0xFFFCC419);
const kMaincolor = Color(0xFF068278);

const kDefaultPadding = 20.0;

const kDefaultShadow = BoxShadow(
  offset: Offset(1, 5),
  blurRadius: 4,
  color: Colors.black26,
);

const textInputDecoration = InputDecoration(
    focusColor: kMaincolor,
    hoverColor: kMaincolor,
    suffixStyle: TextStyle(
        fontFamily: "Ambit",
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: kMaincolor),
    hintStyle: TextStyle(
        fontFamily: "Ambit",
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: kSecondaryColor),
    labelStyle: TextStyle(
        fontFamily: "Ambit",
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: kMaincolor));

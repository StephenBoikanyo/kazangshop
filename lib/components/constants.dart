import 'package:flutter/material.dart';

const kVerticalSpace = SizedBox(height: 30);

const kTextFieldDecoration = InputDecoration(
  fillColor: Colors.white54,
  filled: true,
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const KHeroTextStyle = TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 40,
);

const kAuthority = 'kazang-test.getsandbox.com';

const kTitleStyle =
    TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black);

const kSummaryStyle = TextStyle(fontSize: 12, color: Colors.grey);

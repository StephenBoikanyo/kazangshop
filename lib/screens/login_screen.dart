import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kanzangshop/components/components.dart';
import 'package:kanzangshop/components/constants.dart';
import 'package:kanzangshop/services/services.dart';

class LoginScreen extends StatefulWidget {
  static String id = "LoginScreen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 40, right: 40, top: 200),
          child: Column(
            children: [
              SizedBox(height: 100),
              Flexible(
                child: AnimatedTextKit(animatedTexts: [
                  WavyAnimatedText("KazangShop", textStyle: KHeroTextStyle),
                  WavyAnimatedText("Awesome Stuff", textStyle: KHeroTextStyle),
                  WavyAnimatedText("KazangShop", textStyle: KHeroTextStyle)
                ]),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration:
                    kTextFieldDecoration.copyWith(hintText: "Enter Username"),
              ),
              SizedBox(height: 20),
              TextField(
                decoration:
                    kTextFieldDecoration.copyWith(hintText: "Enter Password"),
              ),
              SizedBox(
                height: 20,
              ),
              OutlinedButton(onPressed: null, child: Text(" Login")),
            ],
          ),
        ),
      ),
    );
  }
}

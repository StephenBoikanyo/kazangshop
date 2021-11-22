import 'package:flutter/material.dart';
import 'package:kanzangshop/components/components.dart';
import 'package:kanzangshop/screens/home_screen.dart';
import 'package:kanzangshop/services/services.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'Login Screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  NetworkHelper networkHelper = new NetworkHelper();

  late String userName;
  String sessionid = '';
  late String password;
  bool showSpinner = false;

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
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
                onChanged: (value) {
                  userName = value;
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: "Enter Username"),
              ),
              SizedBox(height: 20),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
                onChanged: (value) {
                  password = value;
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: "Enter Password"),
              ),
              SizedBox(
                height: 20,
              ),
              RoundedButton(
                  onPressed: () async {
                    var logindata =
                        await networkHelper.login(userName, password);
                    sessionid = logindata['session_id'];
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                HomeScreen(sessionid: sessionid)));
                  },
                  title: 'Login')
            ],
          ),
        ),
      ),
    );
  }
}

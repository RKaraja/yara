import 'package:alan_voice/alan_voice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:yara/library/library.dart';
import 'package:yara/login/login.dart';
import 'package:yara/signup/sign.dart';
import 'package:yara/store/store.dart';
import 'package:yara/welcome/background.dart';
import 'package:yara/components/constants.dart';
import 'package:yara/components/rounded_button.dart';
import 'package:yara/welcome/welcome.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void _handleCommand(Map<String, dynamic> command) {
    switch (command["command"]) {
      case "login":
        Get.to(Login());
        break;
      case "signup":
        Get.to(Sign());
        break;
      case "library":
        Get.to(Library());
        break;
      case "welcome":
        Get.to(Welcome());
        break;
      case "store":
        Get.to(Store());
        break;
      case "payment":
        Get.to(PaymentMethod());
        break;
      case "signout":
        _signOut();
        break;
      default:
        debugPrint("Unknown command");
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    setUpalan();
  }

  bool _greetingIsPlayed = false;

  setUpalan() {
    AlanVoice.addButton(
        "0a5fb66eb0a1c0a982e3318e1aa84f482e956eca572e1d8b807a3e2338fdd0dc/stage",
        buttonAlign: AlanVoice.BUTTON_ALIGN_RIGHT);
    AlanVoice.onCommand.add((command) => _handleCommand(command.data));
    AlanVoice.callbacks.add((command) => _handleCommand(command.data));
    AlanVoice.onButtonState.add((state) {
      if (state.name == "ONLINE" && !_greetingIsPlayed) {
        _greetingIsPlayed = true;
        AlanVoice.activate();
        AlanVoice.playText("Welcome to Yara app."
            "If you want to login say go to login page."
            "If you want to sign up say go to sign up page.");
      }
    });
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'W E L C O M E',
              style: TextStyle(
                fontFamily: 'moneta',
                fontWeight: FontWeight.w900,
                fontSize: 20,
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Image.asset(
              'images/welcome/wc_image.png',
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: 'LOGIN',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Login();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: 'SIGNUP',
              color: kBlueLightColor,
              press: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
    );
  }

  void _signOut() {
    _auth.signOut();
    Get.to(Welcome());
  }
}

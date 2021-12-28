import 'package:alan_voice/alan_voice.dart';
import 'package:flutter/material.dart';
import 'package:yara/login/login.dart';
import 'package:yara/signup/sign.dart';
import 'package:yara/welcome/body.dart';

class Welcome extends StatefulWidget {
  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  _WelcomeState() {}

  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

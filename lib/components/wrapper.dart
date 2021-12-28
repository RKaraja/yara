import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:provider/provider.dart';
import 'package:yara/library/library.dart';
import 'package:yara/services/userapp.dart';
import 'package:yara/store/store.dart';
import 'package:yara/welcome/welcome.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return either library or Authenticate widget
    final userapp = Provider.of<UserApp?>(context);
    if (userapp == null) {
      return Welcome();
    } else {
      return Library();
    }
  }
}

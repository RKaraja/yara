import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:yara/login/login.dart';
import 'package:yara/services/auth.dart';
import 'package:yara/services/userapp.dart';
import 'package:yara/signup/sign.dart';
import 'package:yara/splash_screen.dart';
import 'package:alan_voice/alan_voice.dart';
import 'package:get/get.dart';
import 'package:yara/store/add_controller.dart';
import 'package:yara/store/book_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await StreamController;
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  Get.put(BookmarkController());
  Get.put(BookController());
  Get.put(AddController());
  runApp(GetMaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserApp?>.value(
      value: AuthService().userapp,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'YARA',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: SplashScreen(),
        initialRoute: '/',
        routes: {
          '/login': (context) => Login(),
          '/signup': (context) => Sign(),
        },
      ),
    );
  }
}

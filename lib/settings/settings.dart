import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:yara/components/constants.dart';
import 'package:yara/services/auth.dart';
import 'package:yara/settings/payment_method.dart';
import 'package:yara/welcome/welcome.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late final String text;
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      children: [
        ListTile(
          leading: Icon(
            Icons.payment_outlined,
            color: kBeigeColor,
          ),
          title: Text('Payment Method'),
          onTap: () => Get.to(() => PaymentMethod()),
        ),
        Divider(
          color: Colors.black26,
          thickness: 1,
        ),
        ListTile(
          leading: Icon(
            Icons.person,
            color: kBeigeColor,
          ),
          title: Text('Sign Out'),
          onTap: () async {
            await _auth.signOut();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return Welcome();
                },
              ),
            );
          },
        ),
        Divider(
          color: Colors.black26,
          thickness: 1,
        ),
      ],
    );
  }
}

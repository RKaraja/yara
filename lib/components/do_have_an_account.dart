import 'package:flutter/material.dart';
import 'package:yara/components/constants.dart';
import 'package:yara/login/login.dart';

class DoHaveAnAccount extends StatelessWidget {
  final bool login;
  //final Function press;

  const DoHaveAnAccount({
    Key? key,
    this.login = false,
    //required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? "Don't have an account? " : 'Already have an Account? ',
          style: TextStyle(color: kBlueColor),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Login(),
              ),
            );
          },
          child: Text(
            login ? 'Signup' : 'Login ',
            style: TextStyle(
              color: kBlueLightColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

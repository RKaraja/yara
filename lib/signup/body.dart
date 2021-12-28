import 'package:flutter/material.dart';
import 'package:yara/components/constants.dart';
import 'package:yara/components/do_have_an_account.dart';
import 'package:yara/components/password_field.dart';
import 'package:yara/components/rounded_button.dart';
import 'package:yara/components/rounded_input_field.dart';
import 'package:yara/library/library.dart';
import 'package:yara/services/auth.dart';
import 'package:yara/signup/background.dart';

class Body extends StatefulWidget {
  final Widget child;
  const Body({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // text field state
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'S I G N U P',
                style: TextStyle(
                  fontFamily: 'moneta',
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: size.height * 0.05),
              Image.asset(
                'images/signup/su_image.png',
                height: size.height * 0.45,
              ),
              //SizedBox(height: size.height * 0.03),
              RoundedInputField(
                hintText: 'Email',
                onChanged: (value) {
                  setState(() => email = value);
                },
              ),
              //Fingerprint(),
              PasswordField(
                onChanged: (value) {
                  setState(() => password = value);
                },
              ),
              SizedBox(height: size.height * 0.01),
              RoundedButton(
                text: 'SIGNUP',
                press: () async {
                  if (_formKey.currentState!.validate()) {
                    dynamic result = await _auth.signUpUser(email, password);
                    if (result == null) {
                      setState(() => error = 'Please insert correct email');
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Library();
                          },
                        ),
                      );
                    }
                  }
                },
              ),
              SizedBox(height: size.height * 0.01),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
              SizedBox(height: size.height * 0.01),
              DoHaveAnAccount(
                  //login: false,
                  ),
            ],
          ),
        ),
      ),
    );
  }
}

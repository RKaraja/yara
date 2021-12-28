import 'package:flutter/material.dart';
import 'package:yara/components/do_not_have_an_account.dart';
import 'package:yara/components/password_field.dart';
import 'package:yara/library/library.dart';
import 'package:yara/login/background.dart';
import 'package:yara/components/rounded_button.dart';
import 'package:yara/components/rounded_input_field.dart';
import 'package:yara/services/auth.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
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
                'L O G I N',
                style: TextStyle(
                  fontFamily: 'moneta',
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Image.asset(
                'images/login/li_image.png',
                height: size.height * 0.45,
              ),
              RoundedInputField(
                hintText: 'Email',
                onChanged: (value) {
                  setState(() => email = value);
                },
              ),
              PasswordField(
                onChanged: (value) {
                  setState(() => password = value);
                },
              ),
              SizedBox(height: size.height * 0.01),
              RoundedButton(
                  text: 'LOGIN',
                  press: () async {
                    if (_formKey.currentState!.validate()) {
                      dynamic result = await _auth.logIn(email, password);
                      if (result == null) {
                        setState(() => error = 'Incorrect Credentials!');
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
                  }),
              SizedBox(height: size.height * 0.01),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
              SizedBox(height: size.height * 0.01),
              DoNotHaveAnAccount(
                login: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

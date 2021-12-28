import 'package:flutter/material.dart';
import 'package:yara/components/constants.dart';
import 'package:yara/components/text_field_box.dart';

class PasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;

  const PasswordField({Key? key, required this.onChanged}) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  TextEditingController PasswordField = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFieldBox(
      child: TextFormField(
        validator: (value) =>
            value!.length < 6 ? 'Password is less than 6 characters' : null,
        controller: PasswordField,
        obscureText: true,
        onChanged: widget.onChanged,
        cursorColor: kBlueColor,
        decoration: InputDecoration(
          hintText: 'Password',
          icon: Icon(
            Icons.lock,
            color: kBlueColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kBlueColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

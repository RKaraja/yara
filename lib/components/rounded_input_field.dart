import 'package:flutter/material.dart';
import 'package:yara/components/constants.dart';
import 'package:yara/components/email_field_container.dart';

class RoundedInputField extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.email,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<RoundedInputField> createState() => _RoundedInputFieldState();
}

class _RoundedInputFieldState extends State<RoundedInputField> {
  TextEditingController EmailField = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return EmailFieldContainer(
      child: TextFormField(
        validator: (value) => value!.isEmpty ? 'Enter an email' : null,
        controller: EmailField,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          icon: Icon(
            widget.icon,
            color: kBlueColor,
          ),
          hintText: widget.hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}

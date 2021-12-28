import 'package:flutter/material.dart';
import 'package:yara/components/constants.dart';

class TextFieldBox extends StatelessWidget {
  final Widget child;
  const TextFieldBox({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: kBlueLightColor,
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}

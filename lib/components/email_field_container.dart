import 'package:flutter/material.dart';
import 'package:yara/components/constants.dart';

class EmailFieldContainer extends StatefulWidget {
  final Widget child;
  const EmailFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<EmailFieldContainer> createState() => _EmailFieldContainerState();
}

class _EmailFieldContainerState extends State<EmailFieldContainer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: kBlueLightColor,
        borderRadius: BorderRadius.circular(29),
      ),
      child: widget.child,
    );
  }
}

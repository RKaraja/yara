import 'package:flutter/material.dart';
import 'package:yara/components/constants.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      decoration: new BoxDecoration(
        color: kBeigeColor,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              'images/signup/su_right.png',
              width: size.width * 0.25,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              'images/signup/su_left.png',
              width: size.width * 0.40,
            ),
          ),
          child,
        ],
      ),
    );
  }
}

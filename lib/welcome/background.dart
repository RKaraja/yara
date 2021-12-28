import 'package:flutter/material.dart';
import '../components/constants.dart';

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
      height: size.height,
      width: double.infinity,
      decoration: new BoxDecoration(
        color: kBeigeColor,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              'images/welcome/wc_left.png',
              width: size.width * 0.2,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              'images/welcome/wc_right.png',
              width: size.width * 0.25,
            ),
          ),
          child,
        ],
      ),
    );
  }
}

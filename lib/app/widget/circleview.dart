import 'package:flutter/material.dart';

class CircleView extends StatelessWidget {
  CircleView({
    Key? key,
    required this.height,
    required this.width,
    required this.child,
    this.fillColor = Colors.orange,
    this.borderColor = Colors.black,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  double height;
  double width;
  Color fillColor;
  Color borderColor;
  EdgeInsetsGeometry padding;
  Widget child;

  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: fillColor,
          shape: BoxShape.circle,
          border: Border.all(color: borderColor)),
      child: child,
    );
  }
}

import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final FontWeight fontWeight;
  final Function()? func;
  final TextAlign? textAlign;
  const TextView(
      {Key? key,
      required this.text,
      this.color = Colors.black,
      this.size = 14,
      this.fontWeight = FontWeight.normal,
      this.func,
      this.textAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(
        text,
        style: TextStyle(fontSize: size, color: color, fontWeight: fontWeight),
        textAlign: textAlign,
      ),
      onTap: func,
    );
  }
}

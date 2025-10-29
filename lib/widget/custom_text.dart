import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  const CustomText({super.key, required this.text,this.color, this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      maxLines: 1,
      maxFontSize: 20,
      style: TextStyle(fontWeight: fontWeight, fontSize: 20, color: color),
    );
  }
}

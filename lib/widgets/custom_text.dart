import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final String? title;
  final Color? color;
  final TextOverflow textOverflow;
  final double? size;

  const BigText({
    super.key,
    this.title,
    this.color,
    this.textOverflow = TextOverflow.ellipsis,
    this.size = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title.toString(),
      overflow: textOverflow,
      maxLines: 1,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontFamily: "Roboto",
          fontWeight: FontWeight.w400),
    );
  }
}

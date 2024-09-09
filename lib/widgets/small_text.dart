import 'package:flutter/material.dart';

import '../utils/colors.dart';

class SmallText extends StatelessWidget {
  final String? title;
  final Color color;
  final TextOverflow textOverflow;
  final double? size;
  const SmallText({
    super.key,
    this.title,
    this.color = AppColors.textColor,
    this.textOverflow = TextOverflow.ellipsis,
    this.size = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title.toString(),
      // overflow: textOverflow,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontFamily: "Roboto",
          fontWeight: FontWeight.w400),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:woocomerece/widgets/small_text.dart';

class IconTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  final Color color;

  const IconTextWidget({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor),
        const SizedBox(width: 3.0),
        SmallText(title: text, color: color)
      ],
    );
  }
}

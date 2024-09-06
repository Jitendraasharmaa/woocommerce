import 'package:flutter/material.dart';

class AppIconWidget extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final double size;

  const AppIconWidget({
    super.key,
    required this.icon,
    this.iconColor = const Color(0xfffcf4f3),
    this.backgroundColor = const Color(0xff756d54),
    this.size = 40.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size / 2),
        color: backgroundColor,
      ),
      child: Center(
        child: Icon(
          icon,
          color: iconColor,
         size: 25,
        ),
      ),
    );
  }
}

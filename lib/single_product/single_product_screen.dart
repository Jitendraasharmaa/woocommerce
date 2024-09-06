import 'package:flutter/material.dart';
import 'package:woocomerece/utils/colors.dart';
import 'package:woocomerece/utils/dimesnsions.dart';
import 'package:woocomerece/widgets/app_icon.dart';

class SingleProductScreen extends StatelessWidget {
  const SingleProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.productSize,
              decoration: const BoxDecoration(
                color: AppColors.yellowColor,
                image: DecorationImage(
                  image: AssetImage("assets/images/img_1.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 45,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: AppIconWidget(
                    icon: Icons.arrow_back_ios,
                  ),
                ), AppIconWidget(
                  icon: Icons.shopping_bag_outlined,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

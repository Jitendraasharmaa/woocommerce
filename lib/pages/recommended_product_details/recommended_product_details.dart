import 'package:flutter/material.dart';
import 'package:woocomerece/widgets/custom_text.dart';
import 'package:woocomerece/widgets/expandable_text-widget/expandable_text_widget.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_icon.dart';

class RecommendedProductDetails extends StatefulWidget {
  const RecommendedProductDetails({super.key});

  @override
  State<RecommendedProductDetails> createState() =>
      _RecommendedProductDetailsState();
}

class _RecommendedProductDetailsState extends State<RecommendedProductDetails> {
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
                  child: const AppIconWidget(
                    icon: Icons.close,
                  ),
                ),
                const AppIconWidget(
                  icon: Icons.shopping_bag_outlined,
                ),
              ],
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.productSize - 20,
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimensions.paddingTop20,
                    left: Dimensions.paddingLeft20,
                    right: Dimensions.paddingTop20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    const BigText(
                      title: "Biryani",
                    ),
                    SizedBox(height: Dimensions.sizeHeight10),
                    const ExpandableTextWidget(
                      text:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                    ),
                    SizedBox(height: Dimensions.sizeHeight20),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

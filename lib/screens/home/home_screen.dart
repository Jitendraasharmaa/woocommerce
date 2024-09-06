import 'package:flutter/material.dart';
import 'package:woocomerece/utils/colors.dart';
import 'package:woocomerece/screens/home/widgets/food_page_body.dart';
import 'package:woocomerece/widgets/small_text.dart';

import '../../widgets/custom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 45, bottom: 15),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BigText(
                      title: "Nepal",
                      color: AppColors.mainColor,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SmallText(
                          title: "Kathmandu",
                          color: Colors.black54,
                        ),
                        Icon(
                          Icons.arrow_drop_down_rounded,
                          color: Colors.black54,
                        ),
                      ],
                    )
                  ],
                ),
                Container(
                  width: 35,
                  height: 35,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: const Icon(
                    Icons.search,
                    color: AppColors.whiteColor,
                  ),
                )
              ],
            ),
          ),
          const Expanded(
            child: SingleChildScrollView(
              child: FoodPageBody(),
            ),
          ),
        ],
      ),
    );
  }
}

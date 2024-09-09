import 'package:flutter/material.dart';
import 'package:woocomerece/utils/colors.dart';
import 'package:woocomerece/utils/dimensions.dart';
import 'package:woocomerece/widgets/app_icon.dart';
import 'package:woocomerece/widgets/custom_text.dart';
import 'package:woocomerece/widgets/expandable_text-widget/expandable_text_widget.dart';
import 'package:woocomerece/widgets/icon_text_widget.dart';
import 'package:woocomerece/widgets/small_text.dart';

class SingleProductScreen extends StatelessWidget {
  const SingleProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
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
                    icon: Icons.arrow_back_ios,
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
                  const SizedBox(height: 20),
                  const BigText(
                    title: "Biryani",
                  ),
                  SizedBox(height: Dimensions.sizeWidth10),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(
                          5,
                          (index) {
                            return const Icon(
                              Icons.star,
                              color: AppColors.mainColor,
                              size: 20,
                            );
                          },
                        ),
                      ),
                      SizedBox(width: Dimensions.sizeWidth10),
                      const SmallText(
                        title: "4.5",
                      ),
                      SizedBox(width: Dimensions.sizeWidth10),
                      const SmallText(
                        title: "1250",
                      ),
                      SizedBox(width: Dimensions.sizeWidth10),
                      const SmallText(
                        title: "Comments",
                      ),
                    ],
                  ),
                  SizedBox(height: Dimensions.sizeWidth20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconTextWidget(
                        icon: Icons.circle_sharp,
                        iconColor: AppColors.yellowColor,
                        text: "Normal",
                        color: AppColors.textColor,
                      ),
                      IconTextWidget(
                        icon: Icons.location_on,
                        iconColor: AppColors.mainColor,
                        text: "20.0km",
                        color: AppColors.textColor,
                      ),
                      IconTextWidget(
                        icon: Icons.access_time_rounded,
                        iconColor: AppColors.yellowColor,
                        text: "30 Minutes",
                        color: AppColors.textColor,
                      ),
                    ],
                  ),
                  SizedBox(height: Dimensions.sizeHeight20),
                  const BigText(
                    title: "Introduce",
                  ),
                  const Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableTextWidget(
                        text: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like). Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 120,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          color: AppColors.bottomBackgroundColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(Dimensions.borderRadius15 * 2),
            topLeft: Radius.circular(Dimensions.borderRadius15 * 2),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.paddingLeft20,
                  vertical: Dimensions.paddingTop30),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(Dimensions.borderRadius20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.remove,
                    size: 30,
                    color: AppColors.signColor,
                  ),
                  SizedBox(width: Dimensions.sizeHeight20),
                  const BigText(
                    title: "0",
                  ),
                  SizedBox(width: Dimensions.sizeWidth20),
                  const Icon(
                    Icons.add,
                    size: 30,
                    color: AppColors.signColor,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: AppColors.mainColor,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(Dimensions.borderRadius20),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.paddingLeft30,
                  vertical: Dimensions.paddingTop20 * 2.5,
                ),
              ),
              child: const BigText(
                title: "Add To Cart",
                color: AppColors.whiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

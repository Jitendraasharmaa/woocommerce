import 'package:flutter/material.dart';
import 'package:woocomerece/widgets/custom_text.dart';
import 'package:woocomerece/widgets/expandable_text-widget/expandable_text_widget.dart';

import '../../utils/app_constants.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_icon.dart';

class RecommendedProductDetails extends StatefulWidget {
  final String? imgUrl;
  final String? name;
  final int? price;
  final String? description;

  const RecommendedProductDetails(
      {super.key, this.imgUrl, this.name, this.price, this.description});

  @override
  State<RecommendedProductDetails> createState() =>
      _RecommendedProductDetailsState();
}

class _RecommendedProductDetailsState extends State<RecommendedProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            automaticallyImplyLeading: false,
            title: Row(
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
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  color: Colors.white,
                ),
                child: BigText(
                  title: widget.name,
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                "${AppConstants.baseUrl}/uploads/${widget.imgUrl}",
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: AppColors.whiteColor,
              padding:
                  EdgeInsets.symmetric(horizontal: Dimensions.paddingLeft20),
              child: ExpandableTextWidget(
                text: widget.description.toString(),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.paddingLeft20,
                vertical: Dimensions.paddingTop30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AppIconWidget(
                  icon: Icons.remove,
                  backgroundColor: AppColors.mainColor,
                ),
                SizedBox(width: Dimensions.sizeHeight20),
                 BigText(title: "Rs.${widget.price}"),
                SizedBox(width: Dimensions.sizeHeight20),
                const AppIconWidget(
                  icon: Icons.add,
                  backgroundColor: AppColors.mainColor,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: EdgeInsets.all(Dimensions.paddingLeft20),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius:
                          BorderRadius.circular(Dimensions.borderRadius20),
                    ),
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 50,
                    )),
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
                      vertical: Dimensions.paddingTop20 * 1.5,
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
        ],
      ),
    );
  }
}

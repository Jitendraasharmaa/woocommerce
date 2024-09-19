import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocomerece/controllers/popular_product_controllers.dart';
import 'package:woocomerece/controllers/recommended_product_controller.dart';
import 'package:woocomerece/models/products_model.dart';
import 'package:woocomerece/utils/app_constants.dart';
import 'package:woocomerece/utils/colors.dart';
import 'package:woocomerece/utils/dimensions.dart';
import 'package:woocomerece/widgets/custom_text.dart';
import 'package:woocomerece/widgets/icon_text_widget.dart';
import 'package:woocomerece/widgets/small_text.dart';

import '../../recommended_product_details/recommended_product_details.dart';
import '../../single_product/single_product_screen.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  final PageController _pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  var scaleFactor = 0.8;
  final _height = 220;

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        _currentPageValue = _pageController.page!;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<PopularProductControllers>(builder: (popularProducts) {
          return popularProducts.loading
              ? SizedBox(
                  height: Dimensions.pageView,
                  child: PageView.builder(
                    controller: _pageController,
                    scrollDirection: Axis.horizontal,
                    itemCount: popularProducts.popularProductList.length,
                    // Number of items to display
                    itemBuilder: (context, index) {
                      return _buildPageItem(index,
                          popularProducts.popularProductList[index]);
                    },
                  ),
                )
              : const CircularProgressIndicator(
                  color: AppColors.mainColor,
                  strokeWidth: 2,
                );
        }),
        GetBuilder<PopularProductControllers>(builder: (popularProducts) {
          return DotsIndicator(
            dotsCount: popularProducts.popularProductList.isEmpty
                ? 1
                : popularProducts.popularProductList.length,
            position: _currentPageValue.toInt(),
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          );
        }),
        const SizedBox(height: 30),
        Container(
          margin: EdgeInsets.only(left: Dimensions.marginLeft30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const BigText(
                title: "Recommended",
              ),
              SizedBox(width: Dimensions.sizeWidth10),
              const BigText(
                title: ".",
                color: Colors.black26,
              ),
              SizedBox(width: Dimensions.sizeWidth10),
              const SmallText(title: "Food Pairing")
            ],
          ),
        ),
        GetBuilder<RecommendedProductControllers>(
            builder: (recommendedProducts) {
          return recommendedProducts.loading
              ? Container(
                  margin: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:
                        recommendedProducts.recommendedProductList.length,
                    itemBuilder: (context, index) {
                      final img =
                          recommendedProducts.recommendedProductList[index].img;
                      final name = recommendedProducts
                          .recommendedProductList[index].name;
                      final description = recommendedProducts
                          .recommendedProductList[index].description;
                      final price = recommendedProducts
                          .recommendedProductList[index].price;
                      final stars = recommendedProducts
                          .recommendedProductList[index].stars;
                      final location = recommendedProducts
                          .recommendedProductList[index].location;
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => RecommendedProductDetails(
                                imgUrl: img,
                                name: name,
                                price: price,
                                description: description,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.only(right: 5.0),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  color: AppColors.yellowColor,
                                  borderRadius: BorderRadius.circular(
                                    Dimensions.borderRadius10,
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "${AppConstants.baseUrl}/uploads/$img"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    BigText(
                                      title: "$name",
                                    ),
                                    const SizedBox(height: 5.0),
                                    const SizedBox(
                                      width: 250,
                                      child: SmallText(
                                        title: "Lorem is best dummy paragraph",
                                        textFlow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    SizedBox(height: Dimensions.sizeWidth10),
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconTextWidget(
                                          icon: Icons.circle_sharp,
                                          iconColor: AppColors.iconColor1,
                                          text: "Normal",
                                          color: AppColors.textColor,
                                        ),
                                        IconTextWidget(
                                          icon: Icons.location_on,
                                          iconColor: AppColors.mainColor,
                                          text: "20km",
                                          color: AppColors.textColor,
                                        ),
                                        IconTextWidget(
                                          icon: Icons.access_time_rounded,
                                          iconColor: AppColors.yellowColor,
                                          text: "32min",
                                          color: AppColors.textColor,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                      height: Dimensions.sizeWidth10,
                    ),
                  ),
                )
              : const CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColors.mainColor,
                );
        }),
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel popularProducts) {
    // print("The device height: ${MediaQuery.of(context).size.width}");
    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currScale =
          scaleFactor + (_currentPageValue - index + 1) * (1 - scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currScale = 1 - (_currentPageValue - index) * (1 - scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - scaleFactor) / 2, 0);
    }
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>  SingleProductScreen(
              img: popularProducts.img,
              description: popularProducts.description,
              name: popularProducts.name,
            ),
          ),
        );
      },
      child: Transform(
        transform: matrix,
        child: Stack(
          children: [
            Container(
              height: Dimensions.pageViewContainer,
              margin: const EdgeInsets.only(right: 5, left: 5),
              decoration: BoxDecoration(
                  color: index.isEven
                      ? AppColors.mainColor
                      : AppColors.yellowColor,
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      "${AppConstants.baseUrl}/uploads/${popularProducts.img!}",
                    ),
                  )),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: Dimensions.pageTextContainer,
                margin: EdgeInsets.only(
                  right: Dimensions.marginRight30,
                  left: Dimensions.marginLeft30,
                  bottom: Dimensions.marginBottom30,
                ),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xffe8e8e8),
                      offset: Offset(0, 5),
                    ),
                    BoxShadow(
                      color: Color(0xffe8e8e8),
                      offset: Offset(-5, 0),
                    ),
                    BoxShadow(
                      color: Color(0xffe8e8e8),
                      offset: Offset(5, 0),
                    )
                  ],
                ),
                child: Container(
                  padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(
                        title: popularProducts.name,
                      ),
                      SizedBox(height: Dimensions.sizeHeight10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Wrap(
                            children: List.generate(
                              5,
                              (index) {
                                return const Icon(Icons.star,
                                    color: AppColors.mainColor, size: 20);
                              },
                            ),
                          ),
                          const SmallText(title: "4.5"),
                          const SmallText(title: "1250"),
                          const SmallText(title: "Comments"),
                        ],
                      ),
                      SizedBox(height: Dimensions.sizeHeight10),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconTextWidget(
                            text: "Normal",
                            color: AppColors.textColor,
                            icon: Icons.circle_sharp,
                            iconColor: AppColors.iconColor1,
                          ),
                          IconTextWidget(
                            text: "10km",
                            color: AppColors.textColor,
                            icon: Icons.location_on,
                            iconColor: AppColors.mainColor,
                          ),
                          IconTextWidget(
                            text: "Time",
                            color: AppColors.textColor,
                            icon: Icons.access_time_rounded,
                            iconColor: AppColors.yellowColor,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

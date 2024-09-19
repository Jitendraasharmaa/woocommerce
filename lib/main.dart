import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocomerece/controllers/popular_product_controllers.dart';
import 'package:woocomerece/controllers/recommended_product_controller.dart';
import 'package:woocomerece/pages/home/home_screen.dart';
import 'package:woocomerece/utils/colors.dart';
import 'helper/dependencies.dart' as dep;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //need to initialize the init function in order to use
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
   Get.find<PopularProductControllers>().getPopularProduct();
   Get.find<RecommendedProductControllers>().getRecommendedProduct();
    return GetMaterialApp(
      title: 'Woocommerce',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.mainColor,
          primary: AppColors.mainColor,
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

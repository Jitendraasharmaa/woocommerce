import 'package:get/get.dart';
import 'package:woocomerece/controllers/popular_product_controllers.dart';
import 'package:woocomerece/controllers/recommended_product_controller.dart';
import 'package:woocomerece/data/api/apiclient.dart';
import 'package:woocomerece/data/repository/popular_product_repo.dart';
import 'package:woocomerece/data/repository/recomended_product_repo.dart';
import 'package:woocomerece/utils/app_constants.dart';

Future<void> init() async {
  //api client
  Get.lazyPut(() => APIClient(appBaseUrl: AppConstants.baseUrl));
  //Repo
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  //controllers
  Get.lazyPut(() => PopularProductControllers(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductControllers(recommendedProductRepo: Get.find()));
}

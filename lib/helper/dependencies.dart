import 'package:get/get.dart';
import 'package:woocomerece/controllers/popular_product_controllers.dart';
import 'package:woocomerece/data/api/apiclient.dart';
import 'package:woocomerece/data/repository/popular_product_repo.dart';

Future<void> init() async {
  //api client
  Get.lazyPut(() => APIClient(appBaseUrl: "https://mvs.bslmeiyu.com"));
  //Repo
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  //controllers
  Get.lazyPut(() => PopularProductControllers(popularProductRepo: Get.find()));
}

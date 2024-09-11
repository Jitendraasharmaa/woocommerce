import 'package:get/get.dart';
import 'package:woocomerece/data/repository/popular_product_repo.dart';

class PopularProductControllers extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductControllers({required this.popularProductRepo});

  List<dynamic> _popurlatProductList = [];
  List<dynamic> get popularProductList => _popurlatProductList;

  Future<void> getPopularProduct() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      // _popurlatProductList.addAll();
      update();
    }
  }
}

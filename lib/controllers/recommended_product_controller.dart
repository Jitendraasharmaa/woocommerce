import 'package:get/get.dart';
import 'package:woocomerece/data/repository/popular_product_repo.dart';
import 'package:woocomerece/data/repository/recomended_product_repo.dart';
import 'package:woocomerece/models/products_model.dart';

class RecommendedProductControllers extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;

  RecommendedProductControllers({required this.recommendedProductRepo});

  List<dynamic> _recommendedProductList = [];

  List<dynamic> get recommendedProductList => _recommendedProductList;

  bool _loading = false;

  bool get loading => _loading;

  Future<void> getRecommendedProduct() async {
    Response response = await recommendedProductRepo.getRecommendedProductList();
    if (response.statusCode == 200) {
      _recommendedProductList =[];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      _loading = true;
      // print(_popularProductList);
      update();
    }
  }
}

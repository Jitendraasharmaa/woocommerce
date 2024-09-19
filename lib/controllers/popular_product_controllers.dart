import 'package:get/get.dart';
import 'package:woocomerece/data/repository/popular_product_repo.dart';
import 'package:woocomerece/models/products_model.dart';

class PopularProductControllers extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductControllers({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];

  List<dynamic> get popularProductList => _popularProductList;

  bool _loading = false;

  bool get loading => _loading;

  Future<void> getPopularProduct() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductList =[];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _loading = true;
      // print(_popularProductList);
      update();
    }
  }
}

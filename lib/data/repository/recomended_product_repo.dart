import 'package:get/get.dart';
import 'package:woocomerece/data/api/apiclient.dart';
import 'package:woocomerece/utils/app_constants.dart';

class RecommendedProductRepo extends GetxService {
  final APIClient apiClient;

  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList() async {
    return await apiClient.getData(AppConstants.recommendedProductURl);
  }
}

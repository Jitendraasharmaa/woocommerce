import 'package:get/get.dart';
import 'package:woocomerece/data/api/apiclient.dart';

class PopularProductRepo extends GetxService {
  final APIClient apiClient;

  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    return await apiClient.getData("end point url");
  }
}

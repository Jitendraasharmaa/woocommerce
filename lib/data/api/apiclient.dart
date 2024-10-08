import 'package:get/get.dart';
import 'package:woocomerece/utils/app_constants.dart';

class APIClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  late Map<dynamic, String> _mainHeader;

  APIClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    token= AppConstants.token;
    _mainHeader = {
      "content-type": "application/json; charset=utf-8",
      "Authorization": "Bearer $token",
    };
  }

  Future<Response> getData(String uri) async {
    try {
      Response response = await get(uri);
      return response;
    } catch (e) {
      return Response(
        statusCode: 1,
        statusText: e.toString(),
      );
    }
  }
}

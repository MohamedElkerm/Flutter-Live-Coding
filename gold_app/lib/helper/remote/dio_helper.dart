import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static dioInit() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: "https://www.goldapi.io/api/",
      headers: {
        "x-access-token": "goldapi-11n518l2t5952d-io",
      },
    );
    dio = Dio(baseOptions);
  }
 

  static Future<Response> getData({
    required String path,
  }) async {
    return await dio.get(
      path
    );
  }

  static Future<Response> postData({
    required myPath,
    required myData,
  }) async {
    return await dio.put(
      "$myPath",
      data: myData,
      options: Options(
        
      ),
    );
  }
}

import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'http://127.0.0.1:8000/api/',
        receiveDataWhenStatusError: true,
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        }));
  }

//==========================================================================

  static Future<Response> getData({
    required String url,
     Map<String, dynamic>? query,
  }) async {
    dio?.options.headers = {};
    return await dio!.get(url, queryParameters: query);
  }

//=============================================================================
  static Future<Response> putData({
    required String url,
     Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  }) async {
    dio?.options.headers = {};
    return await dio!.put(url, queryParameters: query, data: data);
  }

//=============================================================================
  static Future<Response> deleteData({
    required String url,
    required Map<String, dynamic>? query,
  }) async {
    dio?.options.headers = {};
    return await dio!.delete(url, queryParameters: query);
  }
}

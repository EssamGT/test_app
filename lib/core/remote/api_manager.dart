
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:test_app/core/res/constants_manager.dart';
@injectable
class ApiManager {
  Dio dio = Dio(BaseOptions(baseUrl: AppConstants.baseUrl))..interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
      enabled: kDebugMode,
    ));

  Future<Response> getRequest(String path,
  ) {
    return dio.get(path,);
  }
}

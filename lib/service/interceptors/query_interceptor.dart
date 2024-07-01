import 'package:dio/dio.dart';

class QueryParamInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.addAll({
      'apiKey': 'd9de84bd46074e99afb1a0303b1e90b1',
    });
    super.onRequest(options, handler);
  }
}
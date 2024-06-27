import 'package:dio/dio.dart';

class QueryParamInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.addAll({
      'apiKey': '55e63be7abab4ef58b07203885bed89d',
    });
    super.onRequest(options, handler);
  }
}
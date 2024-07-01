import 'package:dio/dio.dart';

class QueryParamInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.addAll({
      'apiKey': '83abc16ac0614a148965c0540258e82a',
    });
    super.onRequest(options, handler);
  }
}
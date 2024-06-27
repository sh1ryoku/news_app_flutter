import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/domain/use_cases/search_headlines/search_headlines_case.dart';
import 'package:news_app/domain/use_cases/search_news/search_news_case.dart';
import 'package:news_app/presentation/screens/news_list_screen/state/news_list_screen_state.dart';
import 'package:news_app/service/api_service/api_service.dart';
import 'package:news_app/service/interceptors/query_interceptor.dart';

final getIt = GetIt.instance;

void setup() {
  final dio = Dio(BaseOptions(baseUrl: 'https://newsapi.org/v2/'));
  dio.interceptors.add(QueryParamInterceptor());
  getIt.registerSingleton(dio);
  getIt.registerLazySingleton<ApiService>(
    () => ApiService(getIt.get()),
  );
  getIt.registerFactory<SearchHeadlinesCase>(
    () => SearchHeadlinesCase(apiService: getIt.get()),
  );
  getIt.registerFactory<SearchNewsCase>(
    () => SearchNewsCase(apiService: getIt.get()),
  );
  getIt.registerFactory<NewsListScreenState>(
    () => NewsListScreenState(
      searchNewsCase: getIt.get(),
      searchHeadlinesCase: getIt.get(),
    ),
  );
}

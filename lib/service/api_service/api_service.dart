import 'package:dio/dio.dart';
import 'package:news_app/models/api/search_result/search_result_data.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('everything')
  Future<SearchResultData> searchNews(
    @Query('q') String query,
    @Query('page') int page,
    @Query('pageSize') int pageSize,
  );

  @GET('top-headlines')
  Future<SearchResultData> searchTopHeadlines(
    @Query('category') String category,
    @Query('page') int page,
    @Query('pageSize') int pageSize,
  );
}

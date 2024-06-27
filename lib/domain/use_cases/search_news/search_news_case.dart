import 'package:news_app/models/entities/article/article.dart';
import 'package:news_app/service/api_service/api_service.dart';

class SearchNewsCase {
  SearchNewsCase({
    required ApiService apiService,
  }) : _apiService = apiService;

  final ApiService _apiService;

  Future<List<Article>> run({
    required String query,
    required int page,
    required int pageSize,
  }) async {
    final response = await _apiService.searchNews(
      query = query,
      page = page,
      pageSize = pageSize,
    );

    final searchResult = response.toDomain();
    if (searchResult.status != 'ok') {
      throw Exception('Search result not eshkere');
    }
    final searchResultArticles = searchResult.articles;
    return searchResultArticles;
  }
}

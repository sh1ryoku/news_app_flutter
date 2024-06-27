import 'package:news_app/models/entities/article/articles_page.dart';
import 'package:news_app/service/api_service/api_service.dart';

class SearchHeadlinesCase {
  SearchHeadlinesCase({
    required ApiService apiService,
  }) : _apiService = apiService;

  final ApiService _apiService;

  Future<articlesPage> run({
    required String category,
    required int page,
    required int pageSize,
  }) async {
    final response = await _apiService.searchTopHeadlines(
      category = category,
      page = page,
      pageSize = pageSize,
    );

    final searchResult = response.toDomain();
    if (searchResult.status != 'ok') {
      throw Exception('Search result is not eshkere');
    }

    final searchResultArticlesPage = articlesPage(
      articles: searchResult.articles,
      totalResults: searchResult.totalResults,
    );
    return searchResultArticlesPage;
  }
}

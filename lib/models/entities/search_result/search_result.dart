import 'package:news_app/models/entities/article/article.dart';

class SearchResult {
  SearchResult({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  final String status;
  final int totalResults;
  final List<Article> articles;
}

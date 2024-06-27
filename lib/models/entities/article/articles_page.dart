import 'article.dart';

class ArticlesPage {
  ArticlesPage({
    required this.articles,
    required this.totalResults,
  });

  final List<Article> articles;
  final int totalResults;
}

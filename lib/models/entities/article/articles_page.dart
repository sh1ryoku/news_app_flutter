import 'article.dart';

class articlesPage {
  articlesPage({
    required this.articles,
    required this.totalResults,
  });

  final List<Article> articles;
  final int totalResults;
}
